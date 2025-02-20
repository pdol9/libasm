;;
;;  ssize_t write(int fd, const void *buf, size_t count);
;;

GLOBAL ft_write
EXTERN __errno_location

SECTION .text

ft_write:
	mov rax, 0x1
	syscall
	cmp rax, 0
	jge .end
.err:
	neg rax
	mov r9, rax
	call __errno_location
	mov [rax], r9
	mov rax, -1
.end:
	ret
