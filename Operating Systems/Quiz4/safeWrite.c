#include <stdio.h>
#include <signal.h>
#include <setjmp.h>
#include <stdlib.h>

typedef void (*__sighandler_t) (int);
static jmp_buf jbuf;

void hadler(int signo){
    siglongjmp(jbuf, 1);
}

int safeWrite(int *ptr, int val){

    int status = 0;

    signal(SIGSEGV, hadler);

    if(ptr == NULL) return 1;

    int old_handler = sigsetjmp(jbuf, 1);
    if(old_handler == 0){
        *ptr = val;
    }else{
        status = 1;
    }
    
    return status;
}

int main(){
    // int *a = malloc(10 * sizeof(int));
    int *a;
    int status = safeWrite(&a[1000], 2);
    printf("Status %d\n", status);
    if(status == 0) printf("%d\n", a[1000]);

    return 0;
}