;;
;;
;;	main program to run tests: 
;;	
;;

global _start

%include "header.h"

extern printf
extern ft_write

section .data
		start_msg db "START of the tests", 0ah
		msg_len equ $ - start_msg
		test_msg db "test_msg from ft_write", 0ah
		test_msg_len equ $ - test_msg
		end_msg db "END of the tests.", 0ah
		end_msg_len equ $ - end_msg

section .text
_start:
	;;; start testing functions

	

	; exit
		mov rax, SYS_EXIT
		mov rdi, SUCCESS
		syscall

