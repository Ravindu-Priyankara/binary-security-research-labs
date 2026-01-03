section .text
global _start

_start:
	mov rdi, 0x41414141	; we controlled rdi

	push rdi	; rsp = 0x41414141
	pop rax		; rax = 0x41414141
	
	; or we can use it like this

	push rdi	; rsp = 0x41414141
	xchg rax, rdi	; swap rax, rdi values (rax = 0x41414141 and rdi = rax hold garbage value)
	pop rdi		; rdi replace with old rdi value
