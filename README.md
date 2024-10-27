# libasm

## Description

Following (C) functions are being rewritten into x86-64 assembly using NASM
as an independent library (libasm.a), together with tests.

- ft_strlen:<br>
size_t strlen(const char *s);<br>
```man 3 strlen : Linux Programmer's Manual```

- ft_strcpy:<br>
char *strcpy(char *dest, const char *src);<br>
```man 3 strcpy```

- ft_strcmp:<br>
int strcmp(const char *s1, const char *s2);<br>
```man 3 strcmp```

- ft_write:<br>
ssize_t	write(int fd, const void *buf, size_t count);<br>
```man 2 write```

- ft_read:<br>
ssize_t read(int fd, void *buf, size_t count);<br>
```man 2 read```

- ft_strdup:<br>
char *strdup(const char *s);<br>
```man 3 strdup```


## Installation

- to compile program/library, run ```make```



### Resources:
- https://www.chromium.org/chromium-os/developer-library/reference/linux-constants/syscalls/

Cheat sheet for the syscall calling convention:

arch 	syscall NR 	return 	arg0 	arg1 	arg2 	arg3 	arg4 	arg5
arm 	r7 			r0 		r0 		r1 		r2 		r3 		r4 		r5
arm64 	x8 			x0 		x0 		x1 		x2 		x3 		x4 		x5
x86 	eax 		eax 	ebx 	ecx 	edx 	esi 	edi 	ebp
x86_64 	rax 		rax 	rdi 	rsi 	rdx 	r10 	r8 	r9
