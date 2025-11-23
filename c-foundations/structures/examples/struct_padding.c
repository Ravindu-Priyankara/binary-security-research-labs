#include <stdio.h>
#include <stddef.h>

struct A{
    char a; //1 byte
    char b; // 1 byte
    int c; //4 byte
};

struct B{
    char a; 
    int b; 
    char c; 
};

struct C{
    int a; 
    char b; 
    char c; 
};


int main(){

    size_t size_of_A = sizeof(struct A);
    size_t size_of_B = sizeof(struct B);
    size_t size_of_C = sizeof(struct C);

    struct A a1;
    struct B b1;
    struct C c1;

    printf("Offset of A.a:-\t%zu\n",offsetof(struct A, a));
    printf("Offset of A.b:-\t%zu\n",offsetof(struct A, b));
    printf("Offset of A.c:-\t%zu\n",offsetof(struct A, c));
    printf("Size of A:-\t%zu\n",size_of_A);
    printf("\n");

    printf("Offset of B.a:-\t%zu\n",offsetof(struct B, a));
    printf("Offset of B.b:-\t%zu\n",offsetof(struct B, b));
    printf("Offset of B.c:-\t%zu\n",offsetof(struct B, c));
    printf("Size of B:-\t%zu\n",size_of_B);
    printf("\n");

    printf("Offset of C.a:-\t%zu\n",offsetof(struct C, a));
    printf("Offset of C.b:-\t%zu\n",offsetof(struct C, b));
    printf("Offset of C.c:-\t%zu\n",offsetof(struct C, c));
    printf("Size of C:-\t%zu\n",size_of_C);
    printf("\n");

    return 0;
}