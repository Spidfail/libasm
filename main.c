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

/// Carefull, we do not check if the fd or the file is valid or not to test
/// if the errno value is correctly set.
/// Fd and filename shouldn't be set to NULL or 0 together.
int     test_read(char *filename) {
    char        buff[100];
    ssize_t     rtn = 0;

    FILE    *file = fopen(filename, "r");
    int     fd = 0;
    if (file != NULL)
        fd = fileno(file);
    fpos_t  start = {0};

    if (file != NULL)
        fgetpos(file, &start);
    if (fd <= 2)
        fd = FOPEN_MAX;
    bzero(buff, 100);
    rtn = read(fd, buff, 99);
    printf("\nofficial :  ####################\n%s\n####################\n", buff);
    printf("official return :  %zd\n", rtn);
    if (rtn == -1)
        perror("Official crash : ");
    if (file != NULL)
        fsetpos(file, &start);
    bzero(buff, 51);
    rtn = ft_read(fd, buff, 99);
    printf("\nlibasm :  ####################\n%s\n####################\n", buff);
    printf("libasm return :  %zd\n", rtn);
    if (rtn == -1)
        perror("Libasm crash : ");
    fclose(file);
    return EXIT_SUCCESS;
}

int     main() {
    char    hello[13] = "Hello World!\0";
    ssize_t rtn = 0;
    
    printf("\n##### TEST #####\n");

    printf("\n-----strlen : %s\n", hello);
    printf("official = %zu | return value = %zu\n", strlen(hello), ft_strlen(hello));
    
    printf("\n-----write : %s\n", hello);
    for (size_t i = 0 ; i < 13 ; ++i) {
        rtn = ft_write(1, hello, i);
        printf(" | return value = %zu\n", rtn);
    }
    {
        char *buff = calloc(ft_strlen(hello) + 1, sizeof(char));
        if (buff == NULL)
            return -1;
        printf("\n-----strcpy : %s\n", hello);
        printf("official :  [%p] %s\n", strcpy(buff, hello), buff);
        printf("cleaning    ...\n");;
        bzero(buff, ft_strlen(hello));
        printf("libasm :    [%p] %s\n", ft_strcpy(buff, hello), buff);
        free(buff);
    }
    {
        printf("\n-----strdup :\n");
        test_strdup(hello);
        test_strdup("a");
        test_strdup("\0");
    }
    {
        printf("\n-----read :\n");
        test_read("./ft_read.asm");
        test_read("Wrong");
    }
}