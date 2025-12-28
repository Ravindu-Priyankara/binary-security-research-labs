section .text
global _start:

_start:
	jmp short jump2			    ; jump to jump2

jump1:
	push 0x11111111		    	; reserve space from stack
	
	mov byte [rsp], 0x41		; A
	mov byte [rsp+1], 0x42		; B
	mov byte [rsp+2], 0x43		; C
	mov byte [rsp+3], 0x44		; D

	push 0x1		        	; push number 1 to stack
	pop rax			        	; rax = 1
	movzx edi, al	    		; edi = 0x00000001 (zero extended)
	mov rsi, rsp	    		; rsi = rsp
	push 0x4	    	    	; push length of string to the stack
	pop rdx		        		; rdx = length
	syscall		
	jmp done	        		; jump to the `done`

jump2:
	push 0x11111111		    	; reserve space from stack

	mov byte [rsp], 0x44		; D
        mov byte [rsp+1], 0x43	; C
        mov byte [rsp+2], 0x42	; B
        mov byte [rsp+3], 0x41	; A

	push 0x1		        	; push write syscall number to the stack
	pop rax			        	; rax = syscall number
	movzx edi, al   			; edi = 0x00000001 (zero extended)
	mov rsi, rsp	    		; rsi = rsp (point to stack)
	push 0x4			        ; string length
	pop rdx			        	; rdx = string length
	syscall	
	call jump1

done:
	jmp $
