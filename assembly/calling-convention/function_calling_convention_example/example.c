#include <stdio.h>

void test(int a, int b, int c, int d, int e, int f){
	int g = a + b + c + d + e + f;

	printf("%d", g);
}

int main(){
	
	test(1,2,3,4,5,6);

	return 0;
}