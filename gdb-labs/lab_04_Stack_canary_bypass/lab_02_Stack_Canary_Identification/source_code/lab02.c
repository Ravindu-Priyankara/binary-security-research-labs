#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>

void vuln() {
    char buf[64];
    puts("Input:");
    read(0, buf, 200);
}

int main() {
    vuln();
    puts("Returned safely");
    return 0;
}