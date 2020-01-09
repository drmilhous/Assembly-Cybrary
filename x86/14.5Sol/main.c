#include <stdio.h> 
#include <time.h> 
#include <sys/time.h>   
#include <sys/resource.h> 

///////////////////////////////////
// measure elapsed real time using the "clock_gettime" call. 
// This is one of the most accurate ways to measure wallclock time.
///////////////////////////////////

// struct timespec {                                                                                     
//    time_t   tv_sec;        /* seconds */                                                             
//    long     tv_nsec;       /* nanoseconds */                                                         
// };  

int main () { 
    struct timespec start; 
    clock_gettime(CLOCK_REALTIME, &start); 

    printf("The time is %ld seconds and %ld nanoseconds\n", start.tv_sec, start.tv_nsec); 
}
