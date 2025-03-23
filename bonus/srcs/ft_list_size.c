#include "libasm_bonus.h"

int		ft_list_size(t_list *begin_list)
{
	int size = 0;
	if (begin_list == NULL)
		return size;
	for (t_list *tmp = begin_list; tmp->next != NULL; tmp = tmp->next)
	{
		size++;
	}

	return size;
}
