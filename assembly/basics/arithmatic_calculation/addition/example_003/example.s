section .data
	num1 db 10      
	num2 db 20
	buf db "00",10      ; buffer + newline

section .text
global _start

_start:
	mov al, [num1]
	mov bl, [num2]
	add al, bl          ; al = 30

    ; convert 30 to two ASCII digits
	mov bl, 10    
	xor ah, ah
	div bl 		        ; al/10 → al = quotient(3), ah = remainder(0)

	add al, "0"         ; convert quotient to ASCII
	mov [buf], al

	add ah, "0"         ; convert remainder to ASCII
	mov [buf+1], ah

	; write
	mov rax, 1
	mov rdi, 1
	mov rsi, buf
	mov rdx, 3          ; two digits + newline
	syscall

    ;exit
	mov rax, 60
	mov rdi, 0
	syscall
