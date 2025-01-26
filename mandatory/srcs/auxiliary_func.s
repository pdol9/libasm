;;
;;	auxiliary functions
;;

%include "libasm.inc" 

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
	mov rdi, 0x1
	mov rax, SYS_EXIT
	syscall

;;; ----------------------------------------------------- ;;;

;;; ----------------------------------------------------- ;;;

; put_string(char *s, int len)
put_string:
	push rbp
	mov rbp, rsp
	mov rdi, STDOUT
	mov rax, 0x1
	syscall

	mov rsp, rbp
	pop rbp
	ret

;;; ----------------------------------------------------- ;;;

; print_string(char *s)
print_string:
	push rbp
	mov rbp, rsp
	mov rax, 0x1
	mov rdi, STDOUT
	mov rsi, r11
	lea rdx, [r11 - 1]			;; offset the memory addr
.find_null:
	inc rdx
	cmp BYTE [rdx], 0
	jnz .find_null
	sub rdx, rsi
	syscall
	pop rbp
	ret

;;; ----------------------------------------------------- ;;;

; int itoa(int)
; wip
print_int:
	push rbp
	mov rbp, rsp
; 	mov r9, 0
; 	sub rsp, 16						; --> array size
; 	mov BYTE [rsp], 0				; array[11] = 0;
; 	mov rcx, 10
; .divide:
; 	xor rdx, rdx
; 	inc r9
; 	idiv rcx
; 	add rdx, 48
; 	lea r10, [rsp + r9]
; 	mov [r10], rdx
; 	cmp rax, 0
; 	jnz .divide
; 	; add rsp, r9
; 	lea r11, [r10]
; 	call print_string
	mov rsp, rbp
	pop rbp
	ret