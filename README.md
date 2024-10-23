# libasm

## Description

Following (C) functions are being rewritten into x86-64 assembly using NASM
as an independent library (libasm.a), together with tests.

- ft_strlen:
size_t strlen(const char *s);
```man 3 strlen : Linux Programmer's Manual```

- ft_strcpy:
char *strcpy(char *dest, const char *src);
```man 3 strcpy```

- ft_strcmp:
int strcmp(const char *s1, const char *s2);
```man 3 strcmp```

- ft_write:
ssize_t	write(int fd, const void *buf, size_t count);
```man 2 write```

- ft_read:
ssize_t read(int fd, void *buf, size_t count);
```man 2 read```

- ft_strdup:
char *strdup(const char *s);
```man 3 strdup```


## Installation

- to compile programs/library, run ```make```
