;;
;;
;;	main module to run tests
;;
;;

%include "libasm.inc" 

GLOBAL _start

EXTERN put_string
EXTERN print_string
EXTERN print_int

EXTERN printf
EXTERN puts

EXTERN ft_strlen_tests
EXTERN ft_strcpy_tests
EXTERN ft_strcmp_tests
EXTERN ft_write_tests
EXTERN ft_read_tests
EXTERN ft_strdup_tests

SECTION .data
start_msg	db	"___START of testing___", 0xa, 0
start_len	equ $ - start_msg
end_msg		db	"___END of testing___", 0
end_len		equ $ - end_msg
msg			db	"-Test-msg-from-puts!", 0
fmt			db	"Hello, %s! The number is %d.", 0xa, 0
name		db	"from printf", 0
number		dq	0x424242
newline		db	0xa

;arr dd 0 times 99 dd 58

; SECTION .bss
; 	arr_2		resd 100

SECTION .text

_start:
		mov rdx, start_len
		mov rsi, start_msg
		call put_string

		mov rdi, msg
		call puts
		mov rdx, number
		mov rsi, name
		mov rdi, fmt
		call printf

		mov rax, 123
		call print_int
		mov rdx, 1
		mov rsi, newline
		call put_string
		mov rax, number
		call print_int
		mov rdx, 1
		mov rsi, newline
		call put_string

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		;; test functions

		;; ft_write
		; call ft_write_tests
		
		;; ft_read
		; call ft_read_tests

		;; ft_strlen
		; call ft_strlen_tests

		;; ft_strcpy
		;;call ft_strcpy_tests

		;; ft_strcmp
		; call ft_strcmp_tests

		;; ft_strdup
		; call ft_strdup_tests

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		; end msg
		mov rdx, end_len
		mov rsi, end_msg
		call put_string

		;; exit
		xor rdi, rdi
		mov rax, SYS_EXIT
		syscall
