;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; STACK DATA STRUCTURE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; NASM x86_64 SYNTAX   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .data
	overflow_msg db "STACK OVERFLOW", 10
	underflow_msg db "STACK UNDERFLOW", 10
	len_overflow equ $ - overflow_msg
	len_underflow equ $ - underflow_msg
	newline db 10

section .bss
	stack_space resb 10	; space for 10 bytes (stack element)
	top_index resb 1	; current top index = -1 (empty)
	outbuf resb 1		; single byte buffer for printing digits

section .text
global _start

_start:
	mov byte [top_index], 0xFF	; initialize top index = -1

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;; PUSH NUMBER 3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	mov al, [top_index]	; get top index (-1) 
	cmp al, 9		    ; compare top index with max index
	je .overflow		; if top index equal to max index trigger overflow

	movzx eax, al		; copy with zero extended
	add eax, 1		    ; eax increment by 1
	mov [top_index], al	; set top index = 0

	mov bl, 3		    ; put bl register to 3
	movzx ebx, bl		; copy bl with zero extended
	mov rcx, stack_space; set pointer
	mov dl, [top_index]	; get top index
	add rcx, rdx		; 0 index
	mov [rcx], bl		; set 0th index to 3

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;; PUSH NUMBER 7 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	mov al, [top_index]	; get top index (0)
	cmp al, 9		
	je .overflow

	movzx eax, al		
	add eax, 1		    ; eax + 1 so al = 1
	mov [top_index], al	; top_index = 1

	mov bl, 7
	movzx ebx, bl
	mov rcx, stack_space
	mov dl, [top_index]
	add rcx, rdx
	mov [rcx], bl		; set 1st index to 7

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;; PUSH NUMBER 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	mov al, [top_index]	; get top index (1)
	cmp al, 9
	je .overflow

	movzx eax, al
	add eax, 1		    ; eax + 1 so al = 2
	mov [top_index], al	; top_index = 2

	mov bl, 5
	movzx ebx, bl
	mov rcx, stack_space
	mov dl, [top_index]
	add rcx, rdx
	mov [rcx], bl		; set 2nd index to 5

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;; POP NUMBER 5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	mov al, [top_index]	; get top index to al register(top_index = 2)
	cmp al, 0xFF		; compare al register with lowest index(-1 = empty)
	je .underflow		; jump to underflow if equal 

	movzx eax, al		; copy al with zero extended
	mov rcx, stack_space; make a pointer 
	add rcx, rax		; set pointer index(index is 2)
	mov bl, [rcx]		; extract value from pointer(get 2nd index value from stack_space)

	mov al, [top_index]	; set al to top_index
	sub al, 1		    ; decrement by 1
	mov [top_index], al	; set top index (top_index = 1)

	add bl, '0'		    ; convert to ascii
	mov [outbuf], bl	; move value to outbuf data store
	
	mov rax, 1		    ; write syscall, use for write 2nd index 
	mov rdi, 1
	mov rsi, outbuf
	mov rdx, 1
	syscall

	mov rax, 1		    ; write syscall, use for write new line  
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;; POP NUMBER 7 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	mov al, [top_index]	; top_index = 1
    cmp al, 0xFF
    je .underflow

    movzx eax, al
    mov rcx, stack_space
    add rcx, rax
    mov bl, [rcx]		; get 1st index value

    mov al, [top_index]
    sub al, 1	
    mov [top_index], al	; top_index = 0

    add bl, '0'		
    mov [outbuf], bl

    mov rax, 1
    mov rdi, 1
    mov rsi, outbuf
    mov rdx, 1
    syscall
	
	mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;; POP NUMBER 3 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	mov al, [top_index]	; top_index = 0
    cmp al, 0xFF
    je .underflow

    movzx eax, al
    mov rcx, stack_space
    add rcx, rax
    mov bl, [rcx]		; get 0th index value

    mov al, [top_index]
    sub al, 1
    mov [top_index], al	; top index = -1

    add bl, '0'
    mov [outbuf], bl

    mov rax, 1
    mov rdi, 1
    mov rsi, outbuf
    mov rdx, 1
    syscall

	mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

.overflow:
	mov rax, 1
	mov rdi, 1
	mov rsi, overflow_msg
	mov rdx, len_overflow
	syscall

.underflow:
	mov rax, 1
	mov rdi, 1
	mov rsi, underflow_msg
	mov rdx, len_underflow
	syscall

.exit:				    ; exit syscall
	mov rax, 60
	mov rdi, 0
	syscall