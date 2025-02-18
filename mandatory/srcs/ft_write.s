;;
;;  ssize_t write(int fd, const void *buf, size_t count);
;;

GLOBAL ft_write
EXTERN __errno_location

SECTION .text

ft_write:
	push rbp
	mov rbp, rsp
	mov rax, 0x1					;; SYS_WRITE
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
