;;
;;
;;	module to run tests
;;
;;

%include "libasm.inc" 

global ft_strlen_tests

extern print_string
extern put_string
extern print_int
extern printf
extern strlen

extern ft_strlen

section .data
	test_msg			db	"Test message from: *** ft_strlen ***", 0xa, 0
	test_msg_len		equ	$ - test_msg
	test_msg1			db	"Length of the string above, is: %d", 0xa, 0
	test_msg_len1		equ	$ - test_msg1
	simple_test			db	"simple", 0xa, 0
	simple_test_len		equ	$ - simple_test

section .text

ft_strlen_tests:
	push rbp
	mov rbp, rsp

; ------------------------------------------
	; test case 1
	mov rdx, test_msg_len
	mov rsi, test_msg
	call put_string

	; 1.1 test gnu strlen
	lea rdi, [test_msg]
	call strlen
	mov rsi, rax
	lea rdi, [test_msg1]
	call printf
	; ; 1.2 test ft_strlen
	lea rdi, [test_msg]
	call ft_strlen
	mov rsi, rax
	lea rdi, [test_msg1]
	call printf

; ------------------------------------------
	; test case 2
	mov rsi, simple_test_len
	mov rdi, simple_test
	call printf

	; ; 2.1 test gnu strlen
	lea rdi, [simple_test]
	call strlen
	mov rsi, rax
	lea rdi, [test_msg1]
	call printf
	; ; 2.2 test ft_strlen
	lea rdi, [simple_test]
	call ft_strlen
	mov rsi, rax
	lea rdi, [test_msg1]
	call printf

; ------------------------------------------
	mov rsp, rbp
	pop rbp
	ret