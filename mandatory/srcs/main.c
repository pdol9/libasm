#include "libasm.h"

int main(void) {

		// ft_write
	fprintf(stdout, "---> Start with ft_write\n");
	char *str = "hello\n";
	ft_write(1, str, 6);
	char *str1 = "\n";
	ft_write(1, str1, 1);
	char *str2 = "";
	ft_write(1, str2, strlen(str2));

//	--------  --------  --------  --------  --------  --------  //

		// ft_read
	fprintf(stdout, "---> Start with ft_read\nReading from the test file:\n");
	char buf[4096];
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
	printf("end of --ft_read--\n");

//	--------  --------  --------  --------  --------  --------  //

		// ft_strlen
	fprintf(stdout, "\n---> Start with ft_strlen\n");
	char *t1 = "test test test";
	char *t2 = "1";
	char *t3 = "";

	// 1. test
	int len = strlen(t1);
	int ft_len = ft_strlen(t1);
	printf("Input: '%s'\n", t1);
	if (len == ft_len)
		printf("1. test --> OK\n");
	else
		printf(" *** KO *** : 1. test FAILED\n");

	// 2. test
	len = strlen(t2);
	ft_len = ft_strlen(t2);
	printf("Input: '%s'\n", t2);
	if (len == ft_len)
		printf("2. test --> OK\n");
	else
		printf(" *** KO *** : 2. test FAILED\n");

	// 3. test
	len = strlen(t3);
	ft_len = ft_strlen(t3);
	printf("Input: '%s'\n", t3);
	if (len == ft_len)
		printf("3. test --> OK\n");
	else
		printf(" *** KO *** : 3. test FAILED\n");

//	--------  --------  --------  --------  --------  --------  //

		// ft_strcpy
	fprintf(stdout, "\n---> Start with ft_strcpy\n");
	char src_arr[]="aloha";
	char dst_arr[11] = {0};
	char ft_src_arr[]="aloha";
	char ft_dst_arr[11] = {0};
	char arr_c[5] = "TEST";
	char arr_d[5] = {0};

	// 1. test
	printf("Input: '%s'\n", src_arr);
	char *a = strcpy(dst_arr, src_arr);
	char *b = ft_strcpy(ft_dst_arr, src_arr);
	printf("strcpy: %s\n",a);
	printf("ft_strcpy: %s\n",b);

	// 2. test
	printf("Expected output: 'alohaaloha'\n");
	char *c = strcpy(dst_arr + 5, src_arr);
	char *d = ft_strcpy(ft_dst_arr + 5, src_arr);
	printf("strcpy: %s\n",(c - 5));
	printf("ft_strcpy: %s\n",(d - 5));

	// 3. test
	printf("Overwrite src array:\n");
	char *tmp1 = strdup(src_arr);
	char *tmp2 = strdup(ft_src_arr);
	char *e = strcpy(src_arr, arr_c);
	char *f = ft_strcpy(ft_src_arr, arr_c);
	printf("strcpy: overwrite '%s' -> '%s'\n", tmp1, e);
	printf("ft_strcpy: overwrite '%s' -> '%s'\n", tmp2, f);
	char *g = strcpy(arr_c, arr_d);
	char *h = ft_strcpy(arr_c, arr_d);
	printf("strcpy: overwrite '%s' -> '%s'\n", dst_arr, g + 1);
	printf("ft_strcpy: overwrite '%s' -> '%s'\n", ft_dst_arr, h + 1);
	free(tmp1);
	free(tmp2);

//	--------  --------  --------  --------  --------  --------  //

		// ft_strcmp
	fprintf(stdout, "\n---> Start with ft_strcmp\n");
	char *test1 = "one";
	char *test2 = "one";
	char *test3 = "otest-string";

	// 1. test
	int diff = strcmp(test1, test2);
	int ft_diff = ft_strcmp(test1, test2);
	printf("comparison between '%s' and '%s'.\n", test1, test2);
	if (diff == ft_diff)
		printf("%s vs %s --> OK\n", test1, test2);
	else
		printf(" *** KO *** : %s vs %s; diff: %d vs ft_diff: %d\n", test1, test2, diff,ft_diff);

	// 2. test
	int repeat_once = -1;
repeat:
	diff = strcmp(test1, test3);
	ft_diff = ft_strcmp(test1, test3);
	printf("comparison between '%s' and '%s'.\n", test1, test3);
	if (diff == ft_diff)
		printf("'%s' vs '%s' --> OK\n", test1, test3);
	else
		printf(" *** KO *** : '%s' vs '%s'; diff: %d vs ft_diff: %d\n", test1, test3, diff,ft_diff);

	// 3. test
	// repeat the previous test but with swapped strings' input param
	if (repeat_once == -1) {
		repeat_once++;
		char *tmp = test1;
		test1 = test3;
		test3 = tmp;
		goto repeat;
	}

//	--------  --------  --------  --------  --------  --------  //

		// ft_strdup

//	fprintf(stdout, "\n---> Start with ft_strdup\n");
//	char test1[8] = "abcdefg";
//	char *test2 = "";
//	char *dup, *ft_dup;
//
//	// 1. test
//	dup = strdup(test1);
//	ft_dup = ft_strdup(test1);
//	printf("Input: '%s'\n", test1);
//	printf("strdup: '%s'\n", dup);
//	printf("ft_strdup: '%s'\n", ft_dup);
//
//	// 2. test
//	char *dup_test = strdup(dup);
//	char *ft_dup_test = strdup(ft_dup);
//	printf("Input of pointer dup: '%s'\n", dup);
//	printf("strdup: '%s'\n", dup_test);
//	printf("ft_strdup: '%s'\n", ft_dup_test);
//	free(dup);
//	free(ft_dup);
//	free(dup_test);
//	free(ft_dup_test);
//
//	// 3. test
//	dup = strdup(test1);
//	ft_dup = ft_strdup(test2);
//	printf("Input: '%s'\n", test2);
//	printf("strdup: '%s'\n", dup);
//	printf("ft_strdup: '%s'\n", ft_dup);

//	--------  --------  --------  --------  --------  --------  //

	return 0;
}
