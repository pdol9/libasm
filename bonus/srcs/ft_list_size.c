#include "libasm_bonus.h"

int		ft_list_size(t_list *begin_list)
{
	int size = 0;
	if (begin_list == NULL)
		return size;
	t_list *tmp = begin_list;
	while (tmp)
	{
		size++;
		tmp = tmp->next;
	}

	return size;
}
