;;
;;
;;	function to run tests
;;
;;

%include "header.h" 

global run_strlen_batch

extern println
extern print_int
extern print

extern ft_strlen
extern ft_write
extern ft_read

section .data
		test_msg			db	"Test message from == ft_write ==", 0xa
		test_msg_len		equ	$ - test_msg
		test_msg1			db	"Length of the above string is: "
		test_msg_len1		equ	$ - test_msg1
		test_msg2			db	"", 0xa
		test_msg_len2		equ	$ - test_msg2
		test_msg3			db	""
		test_msg_len3		equ	$ - test_msg3
		strlen_test			db	"42 String", 0xa
		strlen_test_len		equ	$ - strlen_test


section .text

run_strlen_batch:
		push rbp
		mov rbp, rsp

		mov rbx, test_msg
		mov rcx, test_msg_len
		call println

		; 1. test
		mov rdi, strlen_test
		call ft_strlen
		;call print_int
		;mov rbx, 42

		pop rbp
		ret
