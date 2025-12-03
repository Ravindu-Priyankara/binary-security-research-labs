section .data
	num1 db 10
	num2 db 20
	num3 db 0

section .text
global _start

_start:
	mov al, [num1]
	mov bl, [num2]
	add al, bl
	mov [num3], al

	;exit
	mov rax, 60
	mov rdi, 0
	syscall
