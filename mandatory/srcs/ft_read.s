;;
;;	ssize_t read(int fd, void *buf, size_t count);
;;

GLOBAL ft_read

EXTERN __errno_location

SECTION .text

ft_read:
	mov rax, 0x0
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
