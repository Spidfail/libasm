#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>

size_t      ft_strlen(const char *str);
ssize_t     ft_write(int fd, const void *buff, size_t len);
char        *ft_strcpy(char *dest, const char *src);
char        *ft_strdup(const char *s);
ssize_t     ft_read(int fd, void *buf, size_t count);
