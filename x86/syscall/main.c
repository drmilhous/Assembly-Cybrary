#include <stdio.h>
#include <unistd.h>
#include <string.h>
char hello[] = "Hello\n";
int main(int argc, char *argv[])
{
    write(1,hello,strlen(hello));
    return 0;
}
