section .text
global _start

_start:
	;-----------------Write-syscall---------------------;
	push 1
	pop rax							; rax = 1

	mov edi, eax					; rdi = 1
	
	push 0x0a646c72					; "\ndlr"
	mov rbx, 0x6f77206f6c6c6568		; "wo olleh"
	push rbx
	mov rsi, rsp					; "hello wo" + "rld\n"

	push 12
	pop rdx							; rdx = 12 
	syscall				

	;-----------------Exit-syscall ----------------------;
	push 60				
	pop rax							; rax = 60
	xor edi, edi					; rdi = 0
	syscall				
