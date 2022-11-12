#include "libasm.h"

int     main(int ac, char *av[]) {
    char    hello[13] = "Hello World!";
    ssize_t rtn = 0;
    
    printf("\n##### TEST #####\n");

    printf("-----strlen : %s\n", hello);
    printf("official = %zu | return value = %zu\n", strlen(hello), ft_strlen(hello));
    
    printf("-----write : %s\n", hello);
    for (size_t i = 0 ; i < 13 ; ++i) {
        rtn = ft_write(1, hello, i);
        printf(" | return value = %zu\n", rtn);
    }
    {
        char *buff = calloc(ft_strlen(hello), sizeof(char));
        if (buff == NULL)
            return -1;
        printf("-----strcpy : %s\n", hello);
        printf("official :  [%p] %s\n", strcpy(buff, hello), buff);
        printf("cleaning    [%p]...\n", bzero(buff, ft_strlen(hello)));
        printf("libasm :    [%p] %s\n", ft_strcpy(buff, hello), buff);
        free(buff);
    }
    
}