#include <sys/param.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv) {
    char result[PATH_MAX];

    if (argc < 2) {
        fprintf(stderr, "realpath: missing operand\n");
        return 1;
    }

    for (int i = 1; i < argc; ++i) {
        if (realpath(argv[i], result)) {
            printf("%s\n", result);
        } else {
            fprintf(stderr, "Bad path: %s\n", result);
            return 2;
        }
    }

    return 0;
}
