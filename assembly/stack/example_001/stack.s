;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; STACK MEMORY in ASSEMBLY ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;; LINUX x86_64 ASSEMBLY | NASM SYNTAX ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


section .data
	result db '00', 10 		; declare a data store for hold result

section .bss

section .text
global _start

_start:				
	mov rdi, 1				; 1st argument
	mov rsi, 2				; 2nd argument
	mov rdx, 3				; 3rd argument
	mov rcx, 4				; 4th argument
	mov r8, 5				; 5th argument
	mov r9, 6				; 6th argument

	push 10					; 10th argument
	push 9					; 9th argument	
	push 8					; 8th argument
	push 7					; 7th argument

	call sum				; call a sum function

	add rsp, 32				; clean for pushed args (4 * 8 bytes)
	
	xor ah, ah				; make zero 8bit higher register
	mov bl, 10				; assign 10 to bl register
	div bl					; divide (al = quotient and ah = remainder)

	add al, '0'				; convert to ascii
	mov [result], al		; assign ascii value to data store

	add ah, '0'				; convert to ascii
	mov [result + 1], ah	; assign a ascii value 

	mov rax, 1				; write syscall
	mov rdi, 1
	mov rsi, result
	mov rdx, 3
	syscall

	mov rax, 60				; exit syscall
	mov rdi, 0
	syscall
	
sum:
	push rbp				; function prologue
	mov rbp, rsp
	
	xor rax, rax			; make zero rax register otherwise it will fill with garbage values
	add rax, rdi			; rax + 1st argument
	add rax, rsi			; rax + 2nd argument
	add rax, rdx			; rax + 3rd argument
	add rax, rcx			; rax + 4th argument
	add rax, r8				; rax + 5th argument
	add rax, r9				; rax + 6th argument

	xor rbx, rbx			; make zero rbx register
	mov rbx, [rbp+16]		; assign rbx to 7th argument (stack is LIFO)
	add rax, rbx			; rax + 7th argument

	xor rbx, rbx			; make zero rbx register
	mov rbx, [rbp+24]		; assign rbx to 8th argument
	add rax, rbx			; rax + 8th argument
	
	xor rbx, rbx			; make zero rbx register
	mov rbx, [rbp+32]		; assign rbx to 9th argument
	add rax, rbx			; rax + 9th argument
	
	xor rbx, rbx			; make zero rbx register
	mov rbx, [rbp+40]		; assign rbx to 10th argument
	add rax, rbx			; rax + 10th argument

	mov rsp, rbp			; function epilogue
	pop rbp
	ret