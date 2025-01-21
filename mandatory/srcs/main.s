;;
;;
;;	main function to run tests
;;
;;

%include "header.h" 

global _start

extern put_string
extern print_string
extern print_int

extern printf
extern puts

extern ft_strlen_tests
extern ft_strcpy_tests
extern ft_strcmp_tests
extern ft_write_tests
extern ft_read_tests
extern ft_strdup_tests

section .data
	start_msg	db "___START of testing___", 0xa, 0
	start_len	equ $ - start_msg
	end_msg		db "___END of testing___", 0xa, 0
	end_len		equ $ - end_msg
	msg			db	"-Test-msg-from-puts!", 0
	fmt			db "Hello, %s! The number is %d.", 0x0A, 0
	name		db "from printf", 0
	number		dq 42

; 	arr			dd	0
; 		times 99 dd 58

; section .bss
; 	arr_2		resd 100

section .text

_start:
		mov rbx, start_len
		mov r11, start_msg
		call put_string

		;; test for interoperability w/ C lib	
		mov rdi, msg
		call puts
		mov rdx, number
		mov rsi, name
		mov rdi, fmt
		call printf

		; call print_string
		; call print_int
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		;; test functions

		;; ft_write
		; call ft_write_tests
		
		;; ft_read
		call ft_read_tests

		;; ft_strlen
		; call ft_strlen_tests

		;; ft_strcpy
		; call ft_strcpy_tests

		;; ft_strcmp
		; call ft_strcmp_tests

		;; ...
		;; ...

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		; end msg
		mov rbx, end_len
		mov r11, end_msg
		call put_string

		;; exit
		xor rdi, rdi
		mov rax, SYS_EXIT
		syscall