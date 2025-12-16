#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>

void win() {
    puts("You win!");
}

void vuln() {
    char buf[64];
    puts("Input:");
    read(0, buf, 200);   // overflow
}

int main() {
    vuln();
    return 0;
}