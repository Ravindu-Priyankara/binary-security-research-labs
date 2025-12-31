section .text
global _start

_start:
	mov al, 60	; Syscall number for sys_exit
	xor rdi, rdi	; First argument: exit status code 0
	syscall
