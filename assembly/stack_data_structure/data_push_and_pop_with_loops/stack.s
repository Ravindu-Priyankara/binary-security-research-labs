;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; Simple stack data structure to data push and pop ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; LINUX x86_64 NASM SYNTAX ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .data
	inserted_msg db "Pushed value:- ", 0
	len_ins equ $ - inserted_msg
	popped_msg db "Popped value:- ", 0
	len_pop equ $ - popped_msg
	newline db 10

section .bss
	stack_space resb 10	; space for 10 bytes (stack elements)
	top_index resb 1	; top index
	outbuff resb 1		; single byte buffer for printing digits
	inputs resb 1		; single byte buffer for insert data

section .text
global _start

_start:
	mov byte [top_index], 0xFF ; initialize and assign top index to -1
	mov byte [inputs], 0xFF    ; initialize and assign inputs to -1
	
.data_insert:
	mov al, [top_index]	; al = -1,0,1,2,3,4,5,6,7,8,9
	cmp al, 9		    ; compare al register value(top index) and stack higher index value
	je .display_value	; jump ".display_value" label if its equal

	movzx eax, al		; copy al register value with zero extended
	add eax, 1		    ; increment value by one
	mov [top_index], al	; top_index = 0

	mov bl, [inputs]	; bl = -1,0,1,2,3,4,5,6,7,8,9
	movzx ebx, bl		; copy bl register value with zero extended
	add ebx, 1		    ; increment value by one
	mov [inputs], bl	; assign input to bl register value (8 bit)

	mov rcx, stack_space;	; make pointer to stack_space
	add rcx, rax		; set pointer index (begin 0 not -1)
	mov [rcx], bl		; assign value using pointer dereference

	add bl, '0'		    ; convert bl register value to ascii(works only 8 bit)
	mov [outbuff], bl	; set outbuff value as bl register value
	
	mov rax, 1	    	; write syscall
	mov rdi, 1	    	; fd val (fdout)
	mov rsi, inserted_msg	; buffer
	mov rdx, len_ins   	; buffer length 
	syscall		    	; end of write syscall
	
	mov rax, 1	    	; write syscall for write inserted value	
	mov rdi, 1
	mov rsi, outbuff
	mov rdx, 1
	syscall

	mov rax, 1		; write syscall for line break (\n = 10)
        mov rdi, 1
        mov rsi, newline
        mov rdx, 1
        syscall


	jmp .data_insert	; jump to ".data_insert" label (loop)

.display_value:
	mov al, [top_index]	; al = 9,8,7,6,5,4,3,2,1,0.-1
	cmp al, 0xFF		; compare al register value with lowest value(lowest value = -1)
	je .exit		; if al = -1 this will jump to exit

	movzx eax, al		; copy al value and set with zero extended
	mov rcx, stack_space	; make a pointer
	add rcx, rax		; set pointer index value
	mov bl, [rcx]		; get value using pointer
	
	add bl, '0'		; convert to ascii
	mov [outbuff], bl	; set outbuff value as bl value

	sub al, 1		; decrement by one
	mov [top_index], al	; set index value

	mov rax, 1		; write syscall 
	mov rdi, 1
	mov rsi, popped_msg
	mov rdx, len_pop
	syscall

	mov rax, 1		; write syscall (write a popped value)
	mov rdi, 1
	mov rsi, outbuff
	mov rdx, 1
	syscall

	mov rax, 1		; write syscall (line break)
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall

	jmp .display_value	; jump ".display_value" (loop)

.exit:
	mov rax, 60		; exit syscall
	mov rdi, 0
	syscall