#include <stdio.h>
#include <sys/ptrace.h>
#include <unistd.h>
#include <stdlib.h>

int anti_debug() {
    if (ptrace(PTRACE_TRACEME, 0, NULL, NULL) == -1) {
        return 1;   // debugger detected
    }
    return 0;       // no debugger
}

int main() {
    if (anti_debug()) {
        puts("Debugger detected! Exiting...");
        exit(1);
    }

    puts("No debugger detected.");
    puts("Program running normally.");
    return 0;
}