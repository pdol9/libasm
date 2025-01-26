;;
;;  ssize_t write(int fd, const void *buf, size_t count);
;;

global ft_write

section .text

ft_write:
	push rbp
	mov rbp, rsp
	mov rax, 0x1					;; SYS_WRITE
	syscall
	mov rsp, rbp
	pop rbp
	ret