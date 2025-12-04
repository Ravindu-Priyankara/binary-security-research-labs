;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SIGNED DIVISION | NASM SYNTAX ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .data
	num1 db -124
	num2 db 4
	text1 db "Answer is:- ",0
	len equ $ - text1	; length calculate
	result db "00",10	
	sign db "00",0

section .bss


section .text
global _start

_start:
	mov al, [num1]
	mov bl, [num2]
	cbw		        ; extend AL -> AX
	idiv bl		    ; al = quotient(31), ah = remainder(0)

	neg al		    ; convert negative to positive
	mov bl, '-'	    ; add minus sign
	mov [sign], bl	

	; convert quotient to ascii digit
	mov bl, 10
	xor ah, ah
	idiv bl		    ; al = quotient(3), ah = remainder(1)

.convert:		    ; convert to ascii
	add al, '0'
	add ah, '0'

	mov [result], al
	mov [result+1], ah

.print_phrase:	    ; label for write text1
	mov rax, 1
	mov rdi, 1
	mov rsi, text1
	mov rdx, len
	syscall

.print_sign:		; label for write sign
	mov rax, 1
	mov rdi, 1
	mov rsi, sign
	mov rdx, 1
	syscall

.print_result:		; label for write result
	mov rax, 1
	mov rdi, 1
	mov rsi, result
	mov rdx, 3
	syscall

.exit:			    ; label for exit
	mov rax, 60
	mov rdi, 1
	syscall