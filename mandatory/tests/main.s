;;
;;
;;	main function to run tests
;;
;;

%include "header.h" 

global _start

extern println
extern printf
extern run_strlen_batch

section .data
	start_msg	db "START of testing.", 0xa
	start_len	equ $ - start_msg
	end_msg		db "END of testing.", 0xa
	end_len		equ $ - end_msg

section .text

_start:
		;; start
		mov rbx, start_msg
		mov rcx, start_len
		call println

		;; test functions

		;; ft_strlen
		call run_strlen_batch

		;; ft_strcpy

		;; ft_strcmp

		;; end
		mov rbx, end_msg
		mov rcx, end_len
		call println
		
		;; exit
		mov rax, SYS_EXIT
		mov rdi, 0x2a
		syscall
