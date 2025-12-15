#define _FORTIFY_SOURCE 0 
#define _GNU_SOURCE   

#include <stdio.h>
#include <string.h>

void hidden() {
    puts("Hidden function reached!");
}

int main() {
    int flag = 0;
    char buf[16];
    printf("Enter password: ");
    gets(buf);
    if (strcmp(buf, "letmein") == 0) {
        flag = 1;
    }
    if (flag) {
        hidden();
    } else {
        puts("Access denied");
    }
}
