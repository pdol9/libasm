;;
;;
;;	module to run ft_read tests
;;
;;

%include "libasm.inc" 

GLOBAL ft_read_tests

EXTERN clear_buffer
EXTERN error_exit
EXTERN put_string
EXTERN printf

EXTERN ft_read

SECTION .data
test_msg			db	"Test message from *** ft_read ***", 0xa, 0
test_msg_len		equ	$ - test_msg
end_msg				db	"END of ---> ft_read <---", 0xa, 0
end_msg_len			equ	$ - end_msg
err_file_name		db	"10MB.bin", 0
file_name			db	"./srcs/main.s", 0
fmt					db	"File content: %s", 0xa, 0
user_input_prompt	db	"Please provide some content for STDIN & press ENTER:", 0xa, 0
fmt_given_input		db	"User's input: %s", 0xa, 0
buffer_size			equ	2048

SECTION .bss
buffer				resb buffer_size

SECTION .text

ft_read_tests:
		push rbp
		mov rbp, rsp

		mov rdx, test_msg_len
		mov rsi, test_msg
		call put_string
		cmp rax, 0
		jl error_exit

		; 1. test

		;; Zero out the buffer
		mov rcx, buffer_size
		mov rdi, buffer
		call clear_buffer

		;; open a file
		mov rdx, 0644o
		mov rsi, 0x0
		mov rdi, file_name
		mov rax, SYS_OPEN
		syscall
		cmp rax, 0
		jl error_exit

		;; read from a file
		mov r14, rax						;;save fd
		mov rdx, buffer_size
		mov rsi, buffer
		mov rdi, rax
		call ft_read
		cmp rax, 0
		jl .close_fd
		;; print content
		mov rsi, buffer
		mov rdi, fmt
		call printf

		;; close fd
	.close_fd:
		mov rdi, r14
		mov rax, SYS_CLOSE
		syscall
		cmp rax, 0
		jl error_exit

;; ###############################################

		; 2. test

		;; Zero out the buffer
		mov rcx, buffer_size
		mov rdi, buffer
		call clear_buffer

		;; prompt user for input
		mov rdi, user_input_prompt
		call printf

		;; read from STDIN
		mov rdx, buffer_size
		mov rsi, buffer
		mov rdi, STDIN
		call ft_read
		cmp rax, 0
		jl error_exit

		;; print content
		mov rsi, buffer
		mov rdi, fmt_given_input
		call printf

;; --------------------------------------------------------

;; finish
		mov rdx, end_msg_len
		mov rsi, end_msg
		call put_string

		mov rsp, rbp
		pop rbp
		ret
