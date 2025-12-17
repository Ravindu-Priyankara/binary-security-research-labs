#define _FORTIFY_SOURCE 0 
#define _GNU_SOURCE   
#include <stdio.h>

void win() {
    puts("WIN: control flow hijacked");
}

void vuln() {
    char buf[64];
    gets(buf);
}

int main() {
    vuln();
    return 0;
}
