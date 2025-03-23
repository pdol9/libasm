#include "libasm_bonus.h"

int main() {

	t_list test_array[5];
	int array[5];
	int i = 0;
	for (int j = 10; i < 5; ++i, j += 10) {
		array[i] = j;
		test_array[i].data = &array[i];
		test_array[i].next = &test_array[i + 1];
		fprintf(stdout, "value[%d]: %d\n", i, *(int *)(test_array[i].data));
	}
	test_array[i].next = NULL;
	t_list *head = test_array;

	/* ft_list_size */
	int size = ft_list_size(head);
	fprintf(stdout, "Size of the list: %d\n", size);


	/* ft_list_push_front */
	//void	ft_list_push_front(&head, test_array[i].data);

	/* ft_list_sort */
	//void	ft_list_sort(t_list **begin_list, int (*cmp)());



	//int		ft_atoi_base(char *str, char *base);
	//void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
}
