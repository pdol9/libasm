#include "libasm.h"
void	run_strcmp_tests(char *s1, char *s2, int count);
void	run_strlen_tests(char *s1, int count);

int main(void) {

		// ft_write
	fprintf(stdout, "\n-----> Start with ft_write <-----\n\n # 1. test: Writing to the STDOUT\n");
	char *str = "hello\n";
	ft_write(1, str, strlen(str));
	char *str1 = "'\n'";
	ft_write(1, str1, strlen(str1));
	char *str2 = "";
	ft_write(1, str2, strlen(str2));
	printf("\n # 2. test: Writing to a test file:\n");
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

	fprintf(stdout, "\n-----> Start with ft_strdup <-----\n");
	char *test1 = "abcdefgh";
	char *test2 = "";
	char *dup, *ft_dup;

	// 1. test
	dup = strdup(test1);
	// TODO
	ft_dup = strdup(test1);
	printf("\n # 1. test:\nInput: '%s'\n", test1);
	printf("strdup: '%s'\n", dup);
	printf("ft_strdup: '%s'\n", ft_dup);

	// 2. test
	char *dup_test = strdup(dup);
	// TODO
	char *ft_dup_test = strdup(ft_dup);
	printf("Use dup() on already dupped string: '%s'\n", dup);
	printf("strdup: '%s'\n", dup_test);
	printf("ft_strdup: '%s'\n", ft_dup_test);
	free(dup);
	free(ft_dup);
	free(dup_test);
	free(ft_dup_test);

	// 3. test
	dup = strdup(test2);
	// TODO
	ft_dup = strdup(test2);
	printf("Input: '%s'\n", test2);
	printf("strdup: '%s'\n", dup);
	printf("ft_strdup: '%s'\n", ft_dup);
	if (dup)
		free(dup);
	if (ft_dup)
		free(ft_dup);

//	--------  --------  --------  --------  --------  --------  //

	return 0;
}

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
