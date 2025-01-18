# libasm

## Description

Following C functions are being rewritten using x86-64 assembly with NASM
into an independent static library (libasm.a), together with tests. Mandatory
directory contains basic (string) functions, whereas bonus has linked list type
of functions.

Requirement: check for errors during syscalls and properly set them when needed.
- allowed to call the extern ___error or errno_location.

### Functions

- ft_strlen:<br>
size_t strlen(const char *s);<br>
```man 3 strlen     # Linux Programmer's Manual```

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

- to compile library, run:
```cd mandatory/ && make```

- to compile library with tester, run:
```cd mandatory/ && make test```

- to run tests afterwards:
```make run```
