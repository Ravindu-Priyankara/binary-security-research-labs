#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

static int check_tracerpid() {
    FILE *fp;
    char line[256];

    fp = fopen("/proc/self/status", "r");
    if (!fp) {
        return 0; // fail open (real-world behavior)
    }

    while (fgets(line, sizeof(line), fp)) {
        if (strncmp(line, "TracerPid:", 10) == 0) {
            int tracer = atoi(line + 10);
            fclose(fp);

            if (tracer != 0) {
                return 1; // debugger detected
            }
            return 0;
        }
    }

    fclose(fp);
    return 0;
}

int main() {
    if (check_tracerpid()) {
        puts("Debugger detected (TracerPid)!");
        _exit(1);
    }

    puts("No debugger detected.");
    puts("Program running normally.");
    return 0;
}