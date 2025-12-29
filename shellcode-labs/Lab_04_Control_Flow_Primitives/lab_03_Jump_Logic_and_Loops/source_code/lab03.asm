section .text
global _start

_start:
	xor ebx, ebx    ; rbx = 0
	
loop:
	inc ebx         ; ++rbx
	
	push 0x1        
	pop rax         ; rax = 1
	movzx edi, al   ; rdi = 1
	push 0x2e   
	mov rsi, rsp    ; rsi = .
	movzx edx, al   ; rdx = 1
	syscall
		
	sub rsp, 8      ; cleanup stack

	cmp bl, 5       ; if(bl == 5)
	jne loop        

done:
	jmp $ 
