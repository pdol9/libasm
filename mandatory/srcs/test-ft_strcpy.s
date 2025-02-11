;;
;;
;;	module to run ft_strcpy tests
;;
;;

%include "libasm.inc" 

GLOBAL ft_strcpy_tests

EXTERN clear_buffer
EXTERN put_string
EXTERN print_int
EXTERN printf

EXTERN ft_strcpy

SECTION .data
test_msg		db	"Test message from *** ft_strcpy ***", 0xa, 0
test_msg_len	equ	$ - test_msg
str_src			db	"T3sT String from ft_strcpy", 0
check			db	"check with printf: %s", 0xa, 0
empty_src		db	""

SECTION .bss
strcpy_dest		resb 256

SECTION .text

ft_strcpy_tests:
		push rbp
		mov rbp, rsp

		mov rbx, test_msg
		mov rcx, test_msg_len
		call put_string

			; 1. test
		mov rsi, str_src
		mov rdi, strcpy_dest
		call ft_strcpy
		mov r12, rax
		; 1.1 printf check of strcpy_dest
		mov rsi, strcpy_dest
		mov rdi, check
		call printf
		; 1.2 printf check of return value (char *) from ft_strcpy
		mov rsi, r12
		mov rdi, check
		call printf

		mov rcx, 256
		mov rdi, strcpy_dest
		call clear_buffer
			; 2. test -> empty string
		mov rsi, empty_src
		mov rdi, strcpy_dest
		call ft_strcpy
		mov r12, rax
		; 2.1 printf check of strcpy_dest
		mov rsi, strcpy_dest
		mov rdi, check
		call printf
		; 2.2 printf check of return value (char *) from ft_strcpy
		mov rsi, r12
		mov rdi, check
		call printf

		mov rsp, rbp
		pop rbp
		ret
