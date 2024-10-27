;;
;;	auxiliary functions
;;

%include "header.h" 

global println
global print
global print_int

section .bss
		char_arr: resb 11

section .text

;;; ----------------------------------------------------- ;;;

; print string (w/ \n)
println:
		push rbp
		mov rbp, rsp
		mov rax, SYS_WRITE
		mov rdi, STDOUT

.print_data:
		mov rsi, rbx	; load rsi w/ valid memory
		mov rdx, rcx	; give size
		syscall
		cmp rsi, 0xa
		jne .insert_newline
		pop rbp
		ret

.insert_newline:
		mov rbx, 0xa
		mov rcx, 1
		jmp .print_data

;;; ----------------------------------------------------- ;;;

; print string (w/o \n)
print:
		push rbp
		mov rbp, rsp
		mov rax, SYS_WRITE
		mov rdi, STDOUT
		mov rsi, rbx		; char *
		mov rdx, 1			; until '\0' -> acc
		syscall
		pop rbp
		ret

;;; ----------------------------------------------------- ;;;

; int itoa(int)
print_int:
		push rbp
		mov rbp, rsp
		; wip
		pop rbp
		ret
