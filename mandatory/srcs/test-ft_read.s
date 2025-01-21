;;
;;
;;	program to run tests
;;
;;

%include "header.h" 

global ft_read_tests

extern error_exit
extern error_handler
extern put_string
extern print_int
extern printf

extern ft_read

section .data
		test_msg			db	"Test message from *** ft_read ***", 0xa, 0
		test_msg_len		equ	$ - test_msg
		end_msg				db	"END of ---> ft_read <---", 0xa, 0
		end_msg_len			equ	$ - end_msg
		err_file_name		db	"100MB.bin", 0
		file_name			db	"./srcs/main.s", 0
		buffer_size			equ 2048
		fmt					db "File content: %s", 0x0A, 0

section .bss
		buffer				resb buffer_size

section .text

ft_read_tests:
		push rbp
		mov rbp, rsp

		mov rbx, test_msg_len
		mov r11, test_msg
		call put_string

    	; Zero out the buffer
		mov rdi, buffer
		mov rcx, buffer_size
		xor rax, rax      			; set the buffer value
		rep stosb

		; 1. test
		;; open a file
		mov rdx, 0644o
		mov rsi, 0x0
		mov rdi, file_name
		mov rax, SYS_OPEN
		syscall
		cmp rax, 0
		jl error_exit

		;; read from a file
		mov r9, rax						;;save fd
		mov rbx, buffer_size
		mov r11, buffer
		mov rcx, rax
		call ft_read
		neg rbx
		cmp rax, 0
		cmovl rcx, rbx

		;; print content
		mov rsi, buffer
		mov rdi, fmt
		call printf

		;; close it
		mov rdi, r9
		mov rax, SYS_CLOSE
		syscall
		cmp rcx, 0
		jl error_exit

;; --------------------------------------------------------

;; finish
		mov rbx, end_msg_len
		mov r11, end_msg
		call put_string

		mov rsp, rbp
		pop rbp
		ret
