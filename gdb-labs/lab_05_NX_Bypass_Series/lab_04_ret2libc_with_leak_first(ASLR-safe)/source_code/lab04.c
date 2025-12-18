// lab04.c
#include <stdio.h>
#include <unistd.h>

void gadget() {
    asm("pop %rdi; ret;");
}

void vuln() {
    char buf[64];
    puts("Input:");
    read(0, buf, 300);
}

int main() {
    setvbuf(stdout, NULL, _IONBF, 0);
    vuln();
    return 0;
}