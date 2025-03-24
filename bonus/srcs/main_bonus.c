#include "libasm_bonus.h"

int main() {

	t_list *test_list = malloc(sizeof(t_list) * 5);
	if (test_list == NULL)
		return 1;
	t_list **head = &test_list;
	int array[5];
	t_list *tmp = *head;
	int i = 0, j = 10;
	for (; i < 5; ++i, j += 10)
	{
		array[i] = j;
		tmp->data = (void *)&array[i];
		tmp->next = tmp + sizeof(t_list);
		fprintf(stdout, "value[%d]: %d ---- memory: %p\n", i, *(int *)(tmp->data), tmp);
		tmp = tmp->next;
	}
	tmp->next = NULL;
	fprintf(stdout, "last element in array: %p\n", tmp);
	fprintf(stdout, "next of last element in array: %p\n", tmp->next);

	/* ft_list_size */
	int size = ft_list_size(*head);
	fprintf(stdout, "TEST == ft_list_size ==\n");
	fprintf(stdout, "Size of the list: %d\n", size);

	/* ft_list_push_front */
	int test = 333;
	int a = 1000;
	void *x = (void *)&a;
	ft_list_push_front(head, x);
	fprintf(stdout, "TEST == ft_list_push_front ==\n");
	for (t_list *tmp = *head; tmp->next != NULL; tmp = tmp->next) {
		fprintf(stdout, "value: %d and memory location: %p\n", *(int *)(tmp->data), tmp);
	}
	fprintf(stdout, "NEW size of the list: %d\n", ft_list_size(*head));
	free(*head);

	/* ft_list_sort */
	//void	ft_list_sort(t_list **begin_list, int (*cmp)());

	//int		ft_atoi_base(char *str, char *base);
	//void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
}
