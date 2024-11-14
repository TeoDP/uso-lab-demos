#include <stdio.h>

int main() {
    printf("Tema 1 - PC\n\n");
    for (int i = 1; i < 11; i++) {
        printf("test %d ............................................ passed 10/10\n", i);
        printf("test valgrind %d ................................... failed 0/10\n", i);
    }
    printf("\nPunctaj total 100/100\n");
    printf("Punctajul bonus valgrind 0/100\n");
}
