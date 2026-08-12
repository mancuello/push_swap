# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mcuello <mcuello@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/13 17:49:10 by mcuello           #+#    #+#              #
#    Updated: 2025/05/13 16:16:24 by mcuello          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			= push_swap

BONUS			= checker

SRC				= src/list_handler.c\
				  src/list_handler_aux.c\
				  src/parsing.c\
				  src/normalization.c\
				  src/rotations.c\
				  src/turkish_sort.c\
				  src/turkish_sort_aux.c\
				  src/push_swap.c\
				  src/radix_sort.c\
				  src/quick_sort.c\
				  src/aux.c\

BONUS_SRC		= src/checker.c\
				  src/list_handler_aux.c\
				  src/list_handler.c\
				  src/parsing.c\
				  src/normalization.c\
				  src/rotations.c\
				  src/turkish_sort.c\
				  src/turkish_sort_aux.c\
				  src/radix_sort.c\
				  src/quick_sort.c\
				  src/aux.c\

OBJ				= $(SRC:.c=.o)

BONUS_OBJ		= $(BONUS_SRC:.c=.o)

CC				= cc

CFLAGS			= -Wall -Wextra -Werror

LIBFT_DIR		= libft

LIBFT			= $(LIBFT_DIR)/libft.a

all: $(LIBFT) $(NAME)

$(LIBFT):
	@make -C $(LIBFT_DIR) --no-print-directory


$(NAME): $(OBJ)
	$(CC) $(OBJ) $(LIBFT) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -I. -I libft/include -c $< -o $@

bonus: $(BONUS)

$(BONUS): $(BONUS_OBJ)
	$(CC) $(BONUS_OBJ) $(LIBFT) -o $(BONUS)

clean:
	rm -f $(OBJ) $(BONUS_OBJ)

fclean: clean
	make -C $(LIBFT_DIR) fclean --no-print-directory 
	rm -f $(NAME) $(BONUS)

re: fclean all