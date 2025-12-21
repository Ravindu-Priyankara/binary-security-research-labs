#define _GNU_SOURCE
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <stdlib.h>

static long diff_ns(struct timespec *a, struct timespec *b) {
    return (b->tv_sec - a->tv_sec) * 1000000000L +
           (b->tv_nsec - a->tv_nsec);
}

static int timing_check() {
    struct timespec t1, t2;

    clock_gettime(CLOCK_MONOTONIC, &t1);

    // Small logic block (target for breakpoints)
    volatile int x = 0;
    for (int i = 0; i < 100000; i++) {
        x += i;
    }

    clock_gettime(CLOCK_MONOTONIC, &t2);

    long delta = diff_ns(&t1, &t2);

    // Threshold tuned to trigger under debugging
    if (delta > 5000000) { // ~5ms
        return 1; // debugger detected
    }

    return 0;
}

int main() {
    if (timing_check()) {
        puts("Debugger detected (timing)!");
        _exit(1);
    }

    puts("No debugger detected.");
    puts("Program running normally.");
    return 0;
}
