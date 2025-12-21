#define _GNU_SOURCE
#include <unistd.h>
#include <stdint.h>
#include <sys/syscall.h>
#include <stdio.h>

static inline long raw_getpid() {
    long ret;
    asm volatile (
        "mov $39, %%rax\n"   // __NR_getpid (x86_64)
        "syscall\n"
        : "=a"(ret)
        :
        : "rcx", "r11", "memory"
    );
    return ret;
}

int detect_syscall_debugger() {
    volatile long pid1, pid2;

    for (int i = 0; i < 500000; i++) {
        pid1 = raw_getpid();
        pid2 = raw_getpid();

        // Any inconsistency is suspicious
        if (pid1 != pid2)
            return 1;
    }

    return 0;
}

int main() {
    if (detect_syscall_debugger()) {
        puts("Debugger detected (syscall anomaly)!");
        _exit(1);
    }

    puts("No debugger detected.");
    return 0;
}