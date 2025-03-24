#include "libasm_bonus.h"

/*
 * function ft_list_push_front adds a new element of type t_list
	to the beginning of the list.
 * It should assign data to the given argument.
 * If necessary, it’ll update the pointer at the beginning of the list.
 * */

void	ft_list_push_front(t_list **begin_list, void *data)
{
	if (*begin_list == NULL)
		return;
	t_list *new_node = malloc(sizeof(t_list));
	if (new_node == NULL)
		return;
	new_node->data = data;
	new_node->next = *begin_list;
	*begin_list = new_node;
}
