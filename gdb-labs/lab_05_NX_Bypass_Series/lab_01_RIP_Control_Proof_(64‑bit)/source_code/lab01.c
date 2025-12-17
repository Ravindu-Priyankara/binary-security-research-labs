#define _FORTIFY_SOURCE 0 
#define _GNU_SOURCE  
#include <stdio.h>

void vuln() {
    char buf[64];
    puts("Input:");
    gets(buf);
}

int main() {
    vuln();
    return 0;
}