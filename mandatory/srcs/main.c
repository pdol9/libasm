#include "libasm.h"

int main(void) {

	// ft_write
	fprintf(stdout, "Start with ft_write\n");
	char *str = "hello\n";
	ft_write(1, str, 6);
	char *str1 = "\n";
	ft_write(1, str1, 1);
	char *str2 = "";
	ft_write(1, str2, strlen(str2));

	// ft_read
	fprintf(stdout, "Start with ft_read\nReading from the test file:\n");
	char buf[4096];
	// ssize_t bytes_read;
	int fd = open("./srcs/main.c", O_RDONLY);
	if (fd < 0) {
		fprintf(stderr, "Failed to open the file\n");
	}
	else {
		while (read(fd, buf, 1) > 0) {
			write(STDOUT, buf, 1);
		}
		close(fd);
	}
	// ft_strlen
	fprintf(stdout, "\nStart with ft_strlen\n");

	// ft_strcpy

	// ft_strcmp

	// ft_strdup

	return 0;
}