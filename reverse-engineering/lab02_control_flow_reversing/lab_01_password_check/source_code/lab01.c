#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int check(char *input) {
    char secret[] = { 'r','2','_','m','i','n','d',0 };
    return strcmp(input, secret);
}

int main() {
    char buf[64];

    puts("Enter password:");
    fgets(buf, sizeof(buf), stdin);
    buf[strcspn(buf, "\n")] = 0;

    if (check(buf) == 0) {
        puts("Access Granted");
    } else {
        puts("Wrong Password");
    }

    return 0;
}