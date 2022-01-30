#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h> 

#define BUFSIZE 100

void child(int *fd, char **cmd) {
    
    close(fd[0]);

    dup2(fd[1], STDOUT_FILENO);
    dup2(fd[1], STDERR_FILENO);

    execvp(*cmd, cmd);

    printf("ERROR\n");
    close(fd[1]);
    
}

void parse(buf, args)
char *buf;
char **args;
{
    while (*buf != NULL) {
        /*
        * Strip whitespace. Use nulls, so
        * that the previous argument is terminated
        * automatically.
        */
        while ((*buf == ' ') || (*buf == '\t'))
            *buf++ = NULL;
        /*
        * Save the argument.
        */
        *args++ = buf;
        /*
        * Skip over the argument.
        */
        while ((*buf != NULL) && (*buf != ' ') && (*buf != '\t'))
            buf++;
    }
    *args = NULL;
}

int main(int argc, char *argv[]) {

    char **cmd = &argv[1];
    char buf[BUFSIZE];
    int fd[2];
    char *args[64];
    for (;;) {
        
        printf("Command: ");
        if (gets(buf) == NULL) {
            printf("\n");
            exit(0);
        }
        
        parse(buf, args);
        
        if(pipe(fd) < 0) return -1;

        int pid = fork();
        if(pid == 0){
            child(fd, args);
            exit(1);
        }
        sleep(1);
        
        close(fd[1]);
        int n;
        while( (n = read(fd[0], buf, BUFSIZE)) > 0 ){
            write(2, buf, n);
        }
        close(fd[0]);


    }
    return 0;

}


