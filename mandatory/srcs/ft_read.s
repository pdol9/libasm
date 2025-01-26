;;
;;  ssize_t read(int fd, void *buf, size_t count);
;;

global ft_read

section .text

ft_read:
	push rbp
	mov rbp, rsp
	mov rax, 0x0				;; SYS_READ
	syscall
	mov rsp, rbp
	pop rbp
	ret