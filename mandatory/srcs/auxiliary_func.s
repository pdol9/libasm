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
	lea rdx, [rsi - 1]			;; offset the memory addr
	mov rdi, STDOUT
	mov rax, 0x1
.find_null:
	inc rdx
	cmp BYTE [rdx], 0
	jnz .find_null
	sub rdx, rsi
	syscall
	pop rbp
	ret

;;; ----------------------------------------------------- ;;;

; char* itoa(int)
print_int:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	lea r8, [rsp]
	mov rdi, rax
	xor rax, rax
	mov rcx, 2
	;; zero-out 16-bit array
.arr_zeroed:
	mov QWORD [r8], rax
	add r8, 8
	loop .arr_zeroed
	mov rax, rdi
	mov rcx, 10
.divide:
	xor rdx, rdx
	dec r8
	idiv rcx
	add rdx, 48
	mov BYTE [r8], dl
	cmp rax, 0
	jnz .divide

	lea rsi, [r8]
	call print_string
	mov rsp, rbp
	pop rbp
	ret
