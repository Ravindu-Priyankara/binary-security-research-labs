;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 8 X 8 bit MULTIPLICATION | NASM SYNTAX ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .data
	num1 db 2
	num2 db 3
	result db "0", 10

section .bss

section .text
global _start

_start:
	mov al, [num1]
	mov bl, [num2]
	imul bl			; al = 6

.convert_to_ascii:
	add al, '0'
	mov [result], al

.write_result:
	mov rax, 1
	mov rdi, 1
	mov rsi, result
	mov rdx, 2
	syscall

.exit:
	mov rax, 60
	mov rdi, 0
	syscall