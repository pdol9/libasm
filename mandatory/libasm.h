#ifndef LIBASM_H
#define LIBASM_H

// System Call Values
#define SYS_OPEN	0x02
#define SYS_CLOSE	0x03
#define SYS_EXIT	0x3C

// File Descriptors
#define STDOUT		1
#define STDIN		0
#define STDERR		2

#include <stdio.h>
#include <inttypes.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

ssize_t		ft_write(int fd, const void *buf, size_t count);
ssize_t		ft_read(int fd, void *buf, size_t count);
size_t		strlen(const char *s);

#endif