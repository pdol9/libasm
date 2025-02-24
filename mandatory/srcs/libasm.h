#ifndef LIBASM_H
#define LIBASM_H

// System Call Values
#define SYS_OPEN	0x02
#define SYS_CLOSE	0x03
#define SYS_EXIT	0x3C

// File Descriptors
#define STDIN		0
#define STDOUT		1
#define STDERR		2

// Colors
#define CYAN	"\033[1;36m"
#define GREEN	"\033[32m"
#define RESET	"\033[0m"

#include <stdio.h>
#include <inttypes.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>

ssize_t		ft_write(int fd, const void *buf, size_t count);
ssize_t		ft_read(int fd, void *buf, size_t count);
size_t		ft_strlen(const char *s);
char        *ft_strdup(const char *s);
char        *ft_strcpy(char *dest, const char *src);
int         ft_strcmp(const char *s1, const char *s2);

void		run_strcmp_tests(char *s1, char *s2, int count);
void		run_strlen_tests(char *s1, int count);

#endif
