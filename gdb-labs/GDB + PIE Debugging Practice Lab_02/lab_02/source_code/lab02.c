/*
* compile = gcc lab02.c -o lab02 -std=c89 -fPIE -pie -g -fno-stack-protector -z execstack
*/
#define _FORTIFY_SOURCE 0 
#define _GNU_SOURCE    


#include <stdio.h>
#include <string.h>

void win() {
    puts("Yoooo you hit WIN!");
}

void vuln() {
    char buf[32];
    gets(buf);
}

int main() {
    puts("Enter input:");
    vuln();
    return 0;
}