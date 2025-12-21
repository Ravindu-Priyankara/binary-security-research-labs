#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <signal.h>
#include <setjmp.h>

static sigjmp_buf jmp_env;

/* Signal handler for illegal instruction / segfault */
static void sig_handler(int sig) {
    siglongjmp(jmp_env, 1);
}

/*
 * Returns:
 *   1 → debugger detected (HW breakpoints present)
 *   0 → no debugger
 */
int detect_hw_breakpoints() {
    unsigned long dr0, dr1, dr2, dr3;

    /* Install handlers */
    signal(SIGILL, sig_handler);
    signal(SIGSEGV, sig_handler);

    /* If we fault, assume NO debugger */
    if (sigsetjmp(jmp_env, 1) != 0) {
        return 0;
    }

    /* Attempt to read debug registers */
    asm volatile (
        "mov %%dr0, %0\n"
        "mov %%dr1, %1\n"
        "mov %%dr2, %2\n"
        "mov %%dr3, %3\n"
        : "=r"(dr0), "=r"(dr1), "=r"(dr2), "=r"(dr3)
        :
        : "memory"
    );

    /* Any active HW breakpoint? */
    if (dr0 || dr1 || dr2 || dr3)
        return 1;

    return 0;
}

int main() {
    if (detect_hw_breakpoints()) {
        puts("Debugger detected (hardware breakpoint)!");
        _exit(1);
    }

    puts("No debugger detected.");
    return 0;
}
