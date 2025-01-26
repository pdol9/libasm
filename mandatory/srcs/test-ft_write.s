;;
;;
;;	module to run tests for ft_write
;;
;;

%include "libasm.inc" 

global ft_write_tests

extern error_exit
extern error_handler
extern put_string
extern print_int
extern printf

extern ft_write

section .data
		test_msg			db	"Test message from **** ft_write ****", 0xa, 0
		test_msg_len		equ	$ - test_msg
		end_msg				db	"END of __ ft_write __", 0xa, 0
		end_msg_len			equ	$ - end_msg
		test_one			db "TEST ONE", 0xa, 0
		test_one_len		equ $ - test_one
		test_two			db "TEST TWO", 0xa, 0
		test_two_len		equ $ - test_two
		test_file			db "./srcs/test.txt", 0
		file_string			db "FILE TEST: Writing a string into a file.", 0xa
		file_string_len		equ $ - file_string

section .text

ft_write_tests:
		push rbp
		mov rbp, rsp

		mov rdx, test_msg_len
		mov rsi, test_msg
		call put_string
		cmp rax, 0
		jl error_handler

;; --------------------------------------------------------

		; 1.1 test - stdout
		mov rdx, test_one_len				;; len
		mov rsi, test_one					;; addr
		mov rdi, STDOUT						;; fd 
		call ft_write
		cmp rax, 0
		jl error_handler

		; 1.2 test - stdout
		mov rdx, test_two_len
		mov rsi, test_two
		mov rdi, STDOUT
		call ft_write
		cmp rax, 0
		jl error_handler

;; --------------------------------------------------------

		; 2. test - write to a file
		;; create/open a file
		mov rdx, 0644o
		mov rsi, 0x02 | 0x400 | 0x60
		mov rdi, test_file
		mov rax, SYS_OPEN
		syscall
		cmp rax, 0
		jl error_exit

		;; write to a file
		mov r12, rax						;;save fd
		mov rdx, file_string_len
		mov rsi, file_string
		mov rdi, rax
		call ft_write
		;; close file
		mov rdi, r12
		mov rax, SYS_CLOSE
		syscall
		cmp rax, 0
		jl error_exit

;; finish
		mov rdx, end_msg_len
		mov rsi, end_msg
		call put_string

		mov rsp, rbp
		pop rbp
		ret