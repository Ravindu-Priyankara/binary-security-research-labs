#include <stdio.h>

int main(){
    int a = 10;
    int *p = &a;
    int **pp = &p;

    printf("Value of a:-\t%d\n",a);
    printf("Value of pointer:-\t%d\n",*p);
    printf("Value of pointer to pointer:-\t%d\n",**pp);
    printf("address of pointer:-\t%p\n",(void *)&p);
    printf("address of pointer to pointer:-\t%p\n",(void *)&pp);

    return 0;
}