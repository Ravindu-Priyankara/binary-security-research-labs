#include <stdio.h>

void pass(){
    printf("passed!\n");
}

int main(){
    int x = 0;
    if (x){
        pass();
    }else{
        printf("failed!\n");
    }
    return 0;
}