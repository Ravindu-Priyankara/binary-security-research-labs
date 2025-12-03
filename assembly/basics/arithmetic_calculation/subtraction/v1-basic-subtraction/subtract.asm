section .data
	num1 db 10
	num2 db 20
	buf db "00", 10
	sign db "0",0

section .bss

section .text
global _start

_start:
	mov al, [num1]
	mov bl, [num2]
	sub al,	bl
	
	neg al ; convert to positive

	mov bl, 10
	xor ah, ah
	div bl 

	xor cl, cl
	add cl, '-'
	mov [sign], cl
	
	add al, '0'
	mov [buf], al

	add ah, '0'
	mov [buf+1], ah

	;write
	mov rax, 1
	mov rdi, 1
	mov rsi, sign
	mov rdx, 1
	syscall	

	mov rax, 1
	mov rdi, 1
	mov rsi, buf
	mov rdx, 3
	syscall
	
    ;exit
	mov rax, 60
	mov rdi, 0
	syscall