;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Assembly Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; Linux x_86/64 ASSEMBLY With NASM SYNTAX ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


section .data
	num1 db 10			        ; value 1
	num2 db 20			        ; value 2
	outbuf db "00", 10		    ; result store
	phrase db "Output is:- ", 0	; display phrase
	len_phrase equ $ - phrase	; length calculate

section .bss

section .text
global _start

_start:
	mov al, [num1]			    ; load num1 to al register
	mov bl, [num2]			    ; load num2 to bl register 

	xor rdi, rdi			    ; make zero rdi register (mov rdi, 0)
	mov dil, al			        ; dil is 8 bit register of rdi register and add it to val 1
	xor rsi, rsi			    ; make zero rsi register 
	mov sil, bl			        ; rsi is 8 bit register of rsi register and add it to val 2
	call my_func			    ; function calling

	mov bl, 10			        ; assign bl register to 10
	xor ah, ah			        ; make zero ah register( ah is 8 bit higher register)
	div bl				        ; dividing bl (al = quotient, ah = remainder)

	add al, '0'			        ; convert to ascii (this work only (0-99))
	mov [outbuf], al		    ; add ascii value to outbuf

	add ah, '0'			        ; convert to ascii
	mov [outbuf + 1], ah		; assign value to outbuf +1 (al + ah ) it meant ('3'+'0'= '30') 

	mov rax, 1			        ; write syscall
	mov rdi,1
	mov rsi, phrase
	mov rdx, len_phrase
	syscall

	mov rax, 1			        ; write syscall
	mov rdi, 1
	mov rsi, outbuf
	mov rdx, 3
	syscall
	

.exit:
	mov rax, 60			        ; exit syscall
	mov rdi, 0
	syscall
	
my_func:
	push rbp			        ; function prologue
	mov rbp, rsp

	add rdi, rsi			    ; addition
	xor rax, rax			    ; make zero rax register because rax is the return register most cases
	mov rax, rdi			    ; pass rdi value to rax

	mov rsp, rbp			    ; function epilogue
	pop rbp
	ret