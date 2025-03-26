#include "libasm_bonus.h"

void	free_memory(t_list **head)
{
	t_list *tmp, *remove = *head;
	while (remove != NULL) {
		tmp = remove->next;
		free(remove);
		remove = tmp;
	}
}

void	add_node(t_list **head, t_list *new_node)
{
	if (*head == NULL || new_node == NULL)
		return;
	t_list *tmp = *head;
	while (tmp->next)
		tmp = tmp->next;
	tmp->next = new_node;
}

int main()
{
	int z = 4242;
	t_list *test_list = malloc(sizeof(t_list));
	if (test_list == NULL)
		return 1;
	test_list->data = (void *)&z;
	test_list->next = NULL;
	t_list **head = &test_list;
	fprintf(stdout, "TEST list ::: value: %d ---- memory: %p --- next=%p\n", *(int *)(test_list->data), test_list, test_list->next);
	int array[5];
	int i = 0, j = 10;
	for (; i < 5; ++i, j += 10)
	{
		t_list *new_node = malloc(sizeof(t_list));
		if (new_node == NULL)
			return 1;
		array[i] = j;
		new_node->data = (void *)&array[i];
		new_node->next = NULL;
		add_node(head, new_node);
		fprintf(stdout, "value[%d]: %d ---- memory: %p\n", i, *(int *)(new_node->data), new_node);
	}
	for (t_list *tmp = *head; tmp != NULL; tmp = tmp->next) {
		fprintf(stdout, "value: %d --- memory location: %p  --- next=%p\n", *(int *)(tmp->data), tmp, tmp->next);
	}
	fprintf(stdout, "AFTER adding 5 new nodes *** TEST list ::: value: %d ---- memory: %p --- next=%p\n", *(int *)(test_list->data), test_list, test_list->next);

	/* ft_list_size */
	int size = ft_list_size(*head);
	fprintf(stdout, "TEST == ft_list_size ==\n");
	fprintf(stdout, "Size of the list: %d\n", size);

	/* ft_list_push_front */
	int test = 333;
	int a = 999;
	void *x = (void *)&a;
	ft_list_push_front(head, x);
	fprintf(stdout, "TEST == ft_list_push_front ==\n");
	for (t_list *tmp = *head; tmp != NULL; tmp = tmp->next) {
		fprintf(stdout, "value: %d --- memory location: %p  --- next=%p\n", *(int *)(tmp->data), tmp, tmp->next);
	}
	t_list *tmp = *head;
	fprintf(stdout, " OUT new HEAD ::: value: %d --- memory location: %p  --- next=%p\n", *(int *)(tmp->data), tmp, tmp->next);
	fprintf(stdout, "NEW size of the list: %d\n", ft_list_size(*head));

	/* ft_list_sort */
	//void	ft_list_sort(t_list **begin_list, int (*cmp)());

	//int		ft_atoi_base(char *str, char *base);
	//void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
	free_memory(head);

	return 0;
}
