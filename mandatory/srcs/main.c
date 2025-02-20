#include "libasm.h"

int main(void) {

		// ft_write
	fprintf(stdout, "\n-----> Start with ft_write <-----\n\n # 1. test: Writing to the STDOUT\n");
	char *str = "hello\n";
	char *str1 = "'\n'";
	char *str2 = "";
	int check = ft_write(1, str, strlen(str));
	if (check < 0)
		printf(" * write * with bad input has failed: error value: %d\n", check);
	else
		printf("write: Number of written bytes: %d\n", check);
	ft_write(1, str1, strlen(str1));
	ft_write(1, str2, strlen(str2));

	printf("\n # 2. test: testing ERRNO \n");
	// invalid file descriptor
	check = write(-11, "Failing test with invalid fd", 1);
	if (check < 0) {
		printf("* write * with invalid file descriptor has failed: error value: %d\n", check);
		perror("type of error: ");
	} else
		printf("write: Number of written bytes: %d\n", check);
	check = ft_write(-11, "Failing test with invalid fd", 1);
	if (check < 0) {
		printf("* ft_write * with invalid file descriptor has failed: error value: %d\n", check);
		perror("type of error: ");
	} else
		printf("write: Number of written bytes: %d\n", check);
	// invalid address
	check = write(1, (const char *)0x12345678, 2);
	if (check < 0) {
		printf("* write * with bad input has failed: error value: %d\n", check);
		perror("type of error: ");
	} else
		printf("write: Number of written bytes: %d\n", check);
	check = ft_write(1, (const char *)0x12345678, 2);
	if (check < 0){
		printf("* ft_write * with bad input failed: error value: %d\n", check);
		perror("type of error: ");
	} else
		printf("write: Number of written bytes: %d\n", check);

	printf("\n # 3. test: Writing to a test file:\n");
	int fd = open("./test-file-ft_write.txt", O_RDWR | O_CREAT | O_APPEND, 0644);
	if (fd < 0) {
		fprintf(stderr, "Failed to open a test file.\n");
	}
	else {
		char *test_input = "This is a test string.\n";
		write(fd, test_input, strlen(test_input));
		close(fd);
	}
	printf("end of --ft_write--\n");

//	--------  --------  --------  --------  --------  --------  //

		// ft_read
	fprintf(stdout, "\n-----> Start with ft_read <-----\n\n	# 1. test: Reading from the test file:\n\n");
	char buf[4096];
	int err_code = 0;
	fd = open("./srcs/main.c", O_RDONLY);
	if (fd < 0) {
		fprintf(stderr, "Failed to open the file\n");
	}
	else {
		while (read(fd, buf, 1) > 0) {
			write(STDOUT, buf, 1);
		}
		close(fd);
	}

	printf("\n # 2. test: Invalid file descriptor & memory location\n");
	fd = open("./srcs/main.c", O_RDONLY);
	if (fd < 0) {
		fprintf(stderr, "Failed to open the file\n");
	} else {
		// invalid fd
		if ((err_code = read(-123, buf, 1) < 1)) {
			printf("read: value of error: %d\n", err_code);
			perror("type of error: ");
		}
		if ((err_code = ft_read(-123, buf, 1) < 1)) {
			printf("ft_read: value of error: %d\n", err_code);
			perror("type of error: ");
		}
		// invalid address
		if ((err_code = read(fd, (char *)0x12345678, 1)) < 1) {
			printf("read: value of error: %d\n", err_code);
			perror("type of error: ");
		}
		if ((err_code = ft_read(fd, (char *)0x12345678, 1)) < 1) {
			printf("ft_read: value of error: %d\n", err_code);
			perror("type of error: ");
		}
		// invalid size
		if ((err_code = read(fd, buf, -1)) < 1) {
			printf("read: value of error: %d\n", err_code);
			perror("type of error: ");
		}
		if ((err_code = ft_read(fd, buf, -1)) < 1) {
			printf("ft_read: value of error: %d\n", err_code);
			perror("type of error: ");
		}
		close(fd);
	}
	printf("\nend of --ft_read--\n");

//	--------  --------  --------  --------  --------  --------  //

		// ft_strlen
	fprintf(stdout, "\n-----> Start with ft_strlen <-----\n");

	char *test_str[] = {
		"test test test", "9", ""
	};
	for (int i = 0; i < 3; ++i) {
		run_strlen_tests(test_str[i], i);
	}

//	--------  --------  --------  --------  --------  --------  //

		// ft_strcpy
	fprintf(stdout, "\n-----> Start with ft_strcpy <-----\n");
	char src_arr[]="aloha";
	char dst_arr[11] = {0};
	char ft_src_arr[]="aloha";
	char ft_dst_arr[11] = {0};
	char arr_test[5] = "TEST";
	char arr_zero[5] = {0};

	// 1. test
	char *a = strcpy(dst_arr, src_arr);
	char *b = ft_strcpy(ft_dst_arr, src_arr);
	printf("\n # 1. test:\nInput: '%s'\n", src_arr);
	printf("strcpy: %s vs. ft_strcpy: %s\n", a, b);

	// 2. test
	char *c = strcpy(dst_arr + 5, src_arr);
	char *d = ft_strcpy(ft_dst_arr + 5, src_arr);
	printf("\n # 2. test:\nConcatenate two strings.\nExpected output: 'alohaaloha'\nstrcpy: %s vs. ft_strcpy: %s\n", c - 5, d - 5);

	// 3. test
	printf("\n # 3. test: Overwrite src array with 'TEST':\n");
	char *tmp1 = strdup(src_arr);
	char *tmp2 = strdup(ft_src_arr);
	char *e = strcpy(src_arr, arr_test);
	char *f = ft_strcpy(ft_src_arr, arr_test);
	printf("strcpy: '%s' -> '%s'\nft_strcpy: '%s' -> '%s'\n", \
		tmp1, e, tmp2, f);
	free(tmp1);
	free(tmp2);

	// 4. test
	printf("\n # 4. test: (try to) overwrite 'TEST' array with 0:\n");
	char *g = strcpy(arr_test, arr_zero);
	char *h = ft_strcpy(arr_test, arr_zero);
	printf("strcpy: '%s' -> '%s', i.e.: '%s'\nft_strcpy: '%s' -> '%s', i.e.: '%s'\n", \
		dst_arr, g, g + 1, ft_dst_arr, h, h + 1);

//	--------  --------  --------  --------  --------  --------  //

		// ft_strcmp
	fprintf(stdout, "\n-----> Start with ft_strcmp tests <-----\n");

	char *test_strings[] = {
		"", "abcdef", "abcdef", "abcdefyzABCD"
	};
	for (int i = 0; i < 3; ++i) {
		run_strcmp_tests(test_strings[i], test_strings[i + 1], i);
	}

//	--------  --------  --------  --------  --------  --------  //

		// ft_strdup
	fprintf(stdout, "\n-----> Start with ft_strdup <-----\nBehaviour of official function:\n");
	char *test1 = "AbcdefgH";
	char *test2 = "";
	char *dup, *ft_dup;
	char *base = "abc";
	char *src_ptr;
	char *src_ptr_ptr;
	char *src_ptr_ptr_ptr;
	src_ptr = strdup(base);
	src_ptr_ptr = strdup(src_ptr);
	src_ptr_ptr_ptr = strdup(src_ptr_ptr);
	printf("mem addr: %p -> base\n",base);
	printf("mem addr: %p -> base ptr\n",src_ptr);
	printf("mem addr: %p -> ptr of base ptr\n",src_ptr_ptr);
	printf("mem addr: %p -> ptr of ptr of base ptr\n",src_ptr_ptr_ptr);
	free(src_ptr);free(src_ptr_ptr);free(src_ptr_ptr_ptr);

	// 1. test
	dup = strdup(test1);
	ft_dup = ft_strdup(test1);
	printf("\n # 1. test:\nInput: %4s'%s'\n", " ", test1);
	printf("strdup: %3s'%s'\n", " ", dup);
	printf("ft_strdup: '%s'\n", ft_dup);
	printf("Memory addr: %p -> %s\n", test1, "test1 string");
	printf("Memory addr: %p -> %s\n", dup, "dup string");
	printf("Memory addr: %p -> %s\n", ft_dup, "ft_dup string");
	printf("strlen of dup: %d\n", strlen(dup));
	printf("strlen of ft_dup: %d\n", strlen(ft_dup));

	// 2. test
	char *dup_test = strdup(dup);
	char *ft_dup_test = ft_strdup(ft_dup);
	printf("\n # 2. test: Use dup() on already dupped string: '%s'\n", dup);
	printf("strdup: %3s'%s'\n", " ", dup_test);
	printf("ft_strdup: '%s'\n", ft_dup_test);
	free(dup);
	free(ft_dup);
	free(dup_test);
	free(ft_dup_test);

	// 3. test
	dup = strdup(test2);
	ft_dup = ft_strdup(test2);
	printf("\n # 3.test: Input: '%s'\n", test2);
	printf("strdup: %3s'%s'\n", " ", dup);
	printf("ft_strdup: '%s'\n", ft_dup);
	free(dup);
	free(ft_dup);

//	--------  --------  --------  --------  --------  --------  //

	return 0;
}

/// auxiliary functions

// ft_strlen
void	run_strlen_tests(char *s1, int count) {

	int len = strlen(s1);
	int ft_len = ft_strlen(s1);
	printf("\n # %d. test:\nInput: '%s'\n", count + 1, s1);
	if (len == ft_len)
		printf("strlen: %d vs. ft_strlen: %d --> OK\n", len, ft_len);
	else
		printf("  *** KO ***  : strlen: %d vs. ft_strlen: %d\n\n", len, ft_len);
}

// ft_strcmp
void	run_strcmp_tests(char *s1, char *s2, int counter) {

	printf("\n # %d.test:\nComparison between '%s' and '%s'.\n", counter + 1, s1, s2);
do_swap:
	int diff = strcmp(s1, s2);
	int ft_diff = ft_strcmp(s1, s2);
	if (diff == ft_diff)
		printf("strcmp: %d vs. ft_strcmp: %d --> OK\n", diff, ft_diff);
	else
		printf("  *** KO ***  : strcmp: %d vs. ft_strcmp: %d\n\n", diff, ft_diff);
	
	if (counter < 3) {
		counter = 42;				// break out of goto
		char *tmp = s1;
		s1 = s2;
		s2 = tmp;
		printf("  ... swaping input strings for comparison: '%s' and '%s'.\n", s1, s2);
		goto do_swap;
	}
}
