#define _GNU_SOURCE
#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>

volatile int trap_handled = 0;

void trap_handler(int sig) {
    trap_handled = 1;
}

static int int3_check() {
    struct sigaction sa, old;

    sa.sa_handler = trap_handler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;

    sigaction(SIGTRAP, &sa, &old);

    asm volatile ("int3");

    sigaction(SIGTRAP, &old, NULL);

    if (trap_handled == 0) {
        return 1; // debugger detected
    }

    return 0;
}

int main() {
    if (int3_check()) {
        puts("Debugger detected (INT3)!");
        _exit(1);
    }

    puts("No debugger detected.");
    puts("Program running normally.");
    return 0;
}