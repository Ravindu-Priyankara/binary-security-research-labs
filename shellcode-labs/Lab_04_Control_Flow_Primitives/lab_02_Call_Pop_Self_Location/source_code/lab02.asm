section .text
global _start

_start:
	jmp short variables

code_start:
	pop rdi			    ; "/bin//sh"
	push 59			    ; execve syscall number
	pop rax
	xor esi, esi		; argv = 0
	xor edx, edx		; envp = 0
	syscall

	jmp $			    ; loop

variables:
	call code_start
	db "/bin//sh", 0	; variable