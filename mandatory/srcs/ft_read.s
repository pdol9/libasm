;;
;;	ssize_t read(int fd, void *buf, size_t count);
;;

GLOBAL ft_read
EXTERN __errno_location

SECTION .text

ft_read:
	push rbp
	mov rbp, rsp
	mov rax, 0x0				;; SYS_READ
	syscall
	cmp rax, 0
	jge .end
.err:
	neg rax
	mov rbx, rax
	call __errno_location
	mov [rax], rbx
	mov rax, -1
.end:
	mov rsp, rbp
	pop rbp
	ret
