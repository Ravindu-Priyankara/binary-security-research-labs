#include <stdio.h>

int display(){
    int a = 10;
    int b = 20;
    int c = a + b;

    return c;
}

int main(){
    printf("%d", display());
    return 0;
}