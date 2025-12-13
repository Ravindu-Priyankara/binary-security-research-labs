section .text
global _start

_start:
	xor rax, rax	; Make rax register zero
	mov al, 60	; Syscall number for sys_exit
	xor rdi, rdi	; First argument: exit status code 0
	syscall
