;;
;;	auxiliary functions
;;

%include "header.h" 

global put_string
global print_string
global print_int
global error_exit
global error_handler

section .text

error_handler:
	mov rsp, rbp
	pop rbp
	ret

;;; ----------------------------------------------------- ;;;

error_exit:
	mov rdi, ERROR
	mov rax, SYS_EXIT
	syscall

;;; ----------------------------------------------------- ;;;

; put_string(char *s, int len)
put_string:
		push rbp
		mov rbp, rsp
		mov rdx, rbx	; length
		mov rsi, r11	; load rsi w/ memory
		mov rdi, STDOUT
		mov rax, SYS_WRITE
		syscall

		mov rsp, rbp
		pop rbp
		ret

;;; ----------------------------------------------------- ;;;

; print_string(char *s)
print_string:
		push rbp
		mov rbp, rsp
		mov rax, SYS_WRITE
		mov rdi, STDOUT
		mov rsi, r11
		lea rdx, [r11 - 1]			;; offset of memory addr

.find_null:
		inc rdx
		cmp BYTE [rdx], 0
		jnz .find_null
 		sub rdx, rsi
		syscall
		pop rbp
		ret

;;; ----------------------------------------------------- ;;;

; int itoa(int)			--> rcx => input
print_int:
		push rbp
		mov rbp, rsp
		mov r9, 0
		sub rsp, 16						; --> array size
		mov QWORD [rsp], 0				; array[11] = 0;
		mov rcx, 10

; rax -> provided int
.divide:
		xor rdx, rdx
		inc r9
		idiv rcx
		add rdx, 48
		lea r10, [rsp + r9]			;; p = &array[14]
		mov [r10], rdx				;; *p = *(rdx)
		cmp rax, 0
		jnz .divide

		; add rsp, r9
		lea r11, [r10]
		call print_string
		mov rsp, rbp
		pop rbp
		ret
