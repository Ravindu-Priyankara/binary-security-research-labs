#define _FORTIFY_SOURCE 0 
#define _GNU_SOURCE    

#include <stdio.h>
#include <string.h>

void win() {
    puts("You win!");
}

void vuln() {
    char buf[64];
    puts("Enter input:");
    gets(buf);
}

int main() {
    vuln();
    puts("Done");
    return 0;
}
