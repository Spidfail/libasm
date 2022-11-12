#include "libasm.h"

int     test_strdup(const char *ptr) {
        char *rtn_off = NULL;
        char *rtn_cust = NULL;

        printf("Input -> %s\n", ptr);

        printf("official :  %s\n", (rtn_off = strdup(ptr)));
        if (rtn_off == NULL)
            fprintf(stdin, "Return NULL !\n");
        printf("libasm :  %s\n", (rtn_cust = ft_strdup(ptr)));
        if (rtn_cust == NULL)
            fprintf(stdin, "Return NULL !\n");
        if (ptr != NULL && (rtn_cust == NULL || rtn_off == NULL))
            fprintf(stderr, "Error allocation !\n");

        printf(" Comp :  [cust - off] (0 == good) %d\n", strcmp(rtn_cust, rtn_off));
        if (rtn_off)
            free(rtn_off);
        if (rtn_cust)
            free(rtn_cust);
        return EXIT_SUCCESS;
}

int     main(int ac, char *av[]) {
    char    hello[13] = "Hello World!\0";
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
        char *buff = calloc(ft_strlen(hello) + 1, sizeof(char));
        if (buff == NULL)
            return -1;
        printf("-----strcpy : %s\n", hello);
        printf("official :  [%p] %s\n", strcpy(buff, hello), buff);
        printf("cleaning    ...\n");;
        bzero(buff, ft_strlen(hello));
        printf("libasm :    [%p] %s\n", ft_strcpy(buff, hello), buff);
        free(buff);
    }
    {
        printf("-----strdup :\n");
        test_strdup(hello);
        test_strdup("a");
        test_strdup("\0");
    }
}