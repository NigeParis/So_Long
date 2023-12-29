###############################################################################
## ARGUMENTS

NAME=so_long
CFLAGS=-Wall -Wextra -Werror
SRCS=$(addprefix $(SRC_DIR), $(SRC))
OBJ=$(SRC:.c=.o)
HEAD=$(addprefix $(INCLUDE), $(HEADER))
CCOPTIONS=-c
SRC_OBJ=$(addprefix $(OBJ_DIR), $(OBJ))
BONUS_SRC=$(addprefix $(BONUS_DIR), $(BONUS))
BONUS_OBJ=$(addprefix $(BONUS_DIR), $(BONUS:.c=.o))
CC=cc

###############################################################################
## SOURCES 

SRC_DIR=
OBJ_DIR=
BONUS_DIR=
INCLUDE=
SRC=maps.c

HEADER=mlx.h
###############################################################################
## RULES

all: $(NAME)
	@echo "\nDone ! .......\n"

$(NAME): $(OBJ)
	@echo "\nCreating Libft.a FILE .......\n"
	ar -rcs $(NAME) $(OBJ)
$(OBJ):
	@echo "\nCOMPILE all c files to .o FILES .......\n"
	$(CC) $(CFLAGS) $(CCOPTIONS) $(SRCS) -I./$(HEAD)

bonus:
	@echo "\nCOMPILE all c files to .o FILES .......\n"
	$(CC) $(CFLAGS) $(CCOPTIONS) $(SRCS) -I./$(HEAD)
	$(CC) $(CFLAGS) $(CCOPTIONS) $(BONUS_SRC) -I./$(HEAD)
	@echo "\nCreating Libft.a FILE .......\n"
	ar -rcs $(NAME) $(OBJ) $(BONUS_OBJ)
	@echo "\nDone ! with bonus functions ......\n"
	
clean:
	rm -f $(SRC_OBJ) $(BONUS_OBJ)

fclean:clean
	@echo "\nFCLEAN all .o et .a files .......\n"
	rm -f $(NAME)

re:fclean all
	@echo "\nAll erased and re-compiled .......\n"

.PHONY: all clean fclean re bonus
