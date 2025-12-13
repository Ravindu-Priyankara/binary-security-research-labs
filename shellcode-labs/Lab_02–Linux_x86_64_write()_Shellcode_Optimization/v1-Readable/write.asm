section .text
global _start

_start:
	; --- Syscall: write (syscall number 1) ---
	xor rax, rax				; Clear RAX (RAX = 0)
	inc rax						; Set RAX to 1 (RAX = sys_write)

	xor rdi, rdi				; Clear RDI (RDI = 0)
	inc rdi						; Set RDI to 1 (RDI = stdout file descriptor)

	; --- Prepare string on the stack (LIFO) ---
    ; The string "hello world\n" is pushed backwards onto the stack
    ; as "dlr\n" (4 bytes) and "ow olleh" (8 bytes).

    ; Push the last 4 bytes: 0x0a646c72 = "\n"+"d"+"l"+"r" (in little-endian)
	push 0x0a646c72				; Stack: [...\nldr] (Correction: should be "\ndlr")

	; Load the first 8 bytes: 0x6f77206f6c6c6568 = "o"+"w"+" "+"o"+"l"+"l"+"e"+"h"
	mov rbx, 0x6f77206f6c6c6568	; RBX = "ow olleh" (8 bytes)
	push rbx					; Stack: [...\nldr][ow olleh] -> "hello world\n"

	; Set the starting address of the string buffer
	mov rsi, rsp				; Set RSI to RSP (RSI = address of the string on the stack)

	; --- Set write length ---
	xor rdx, rdx				; Clear RDX (RDX = 0)
	mov dl, 12	 				; Set DL (lower 8 bits of RDX) to 12 (RDX = count of bytes to write)
	syscall						; Execute the sys_write(1, rsp, 12)

	; --- Syscall: exit (syscall number 60) ---
	xor rax, rax				; Clear RAX (RAX = 0)
	mov al, 60					; Set AL (lower 8 bits of RAX) to 60 (RAX = sys_exit)
	xor rdi, rdi				; Clear RDI (RDI = 0) (RDI = exit status 0)
    syscall                     ; Execute the sys_exit(0)
