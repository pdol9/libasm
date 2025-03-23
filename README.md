# libasm

## Description

Rewriting the C functions listed below in x86-64 assembly using NASM to create a static 
library (```libasm.a```). Tests for these functions are provided in C (```main.c```),
as well as in assembly (```main.s```).

The mandatory directory contains basic string functions (*completed*), while the bonus
section includes linked list functions (*WIP*).

Since some rewritten functions use system calls and may call ```___errno_location```,
it is possible to check the type of error (e.g., ```Bad file descriptor```, ```Bad address```).
As a result, perror() will return or print an appropriate error message.

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
```bash
cd ./mandatory/ && make
```

- to compile library with tester, run:
```bash
cd ./mandatory/ && make ctest
```
