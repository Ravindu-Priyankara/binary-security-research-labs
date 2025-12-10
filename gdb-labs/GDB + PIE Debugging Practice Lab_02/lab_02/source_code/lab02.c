/*
* compile = gcc lab02.c -o lab02 -fPIE -pie -g -fno-stack-protector -z execstack
*/

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