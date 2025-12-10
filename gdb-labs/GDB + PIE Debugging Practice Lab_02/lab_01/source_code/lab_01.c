/*
* compile = gcc lab01.c -o lab01 -fPIE -pie -g
*/

#include <stdio.h>

void secret() {
    puts("You found the secret!");
}

int main() {
    printf("Main at: %p\n", main);
    printf("Secret at (no call): %p\n", secret);

    int x;
    scanf("%d", &x);

    return 0;
}
