;;
;;  ssize_t write(int fd, const void *buf, size_t count);
;;

%include "header.h" 

global ft_write

section .text

ft_write:
	push rbp
	mov rbp, rsp

	mov rdx, rbx			;; len
	lea rsi, [r11]			;; char *buffer 
	mov rdi, rcx			;; int fd
	mov rax, SYS_WRITE
	syscall

	mov rsp, rbp
	pop rbp
	ret