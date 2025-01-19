;;
;;  ssize_t read(int fd, void *buf, size_t count);
;;

%include "header.h"

global ft_read

section .text

ft_read:
	push rbp
	mov rbp, rsp

	mov rdx, rbx			;; len
	mov rsi, r11			;; char *buffer 
	mov rdi, rcx			;; int fd
	mov rax, SYS_READ
	syscall

	mov rsp, rbp
	pop rbp
	ret