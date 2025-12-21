#include <stdio.h>
#include <stdint.h>
#include <unistd.h>

static inline uint64_t rdtsc() {
    uint32_t lo, hi;
    asm volatile (
        "rdtsc"
        : "=a"(lo), "=d"(hi)
        :
        : "memory"
    );
    return ((uint64_t)hi << 32) | lo;
}

int detect_debugger_timing() {
    uint64_t t1, t2;
    volatile int i;

    t1 = rdtsc();

    // Small workload (real binaries do crypto / syscalls here)
    for (i = 0; i < 100000; i++) {
        asm volatile("nop");
    }

    t2 = rdtsc();

    uint64_t delta = t2 - t1;

    // Threshold tuned for real systems
    if (delta > 1000000) {
        return 1; // debugger detected
    }

    return 0;
}

int main() {
    if (detect_debugger_timing()) {
        puts("Debugger detected (timing anomaly)!");
        _exit(1);
    }

    puts("No debugger detected.");
    return 0;
}
