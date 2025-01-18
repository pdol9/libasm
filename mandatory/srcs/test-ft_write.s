;;
;;
;;	module to run tests for ft_write
;;
;;

%include "header.h" 

global ft_write_tests

extern put_string
extern print_int
extern print

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

section .text

ft_write_tests:
		push rbp
		mov rbp, rsp

		mov rbx, test_msg_len
		mov r11, test_msg
		call put_string

		; 1.1 test - stdout
		mov rbx, test_one_len				;; len
		mov r11, test_one					;; addr
		mov rcx, 0x1						;; fd 
		call ft_write

		; 1.2 test - stdout
		mov rbx, test_two_len
		mov r11, test_two
		mov rcx, 0x1
		call ft_write

		; 2. test - write to a file
		; wip


		mov rbx, end_msg_len
		mov r11, end_msg
		call put_string

		mov rsp, rbp
		pop rbp
		ret
