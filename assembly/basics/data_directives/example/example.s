section .data
	val1 db "ABC",0 ;0 used for null terminator
	val2 db 1

section .text
global _start

_start:
	MOV rbx, val1 	; pointer to "ABC"
	MOV cl, [val2] 	; load 1 byte into CL

	;exit
	MOV rax, 60
	MOV rdi, 0
	syscall
