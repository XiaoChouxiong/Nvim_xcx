CC = gcc
CFLAGS = -Wall -Werror

INCLUDES = -I./funs

SRCS = $(wildcard *.c) $(wildcard funs/*.c)
OBJS = $(SRCS:.c=.o)

myprogram: $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) $(OBJS) -o myprogram

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJS) myprogram

