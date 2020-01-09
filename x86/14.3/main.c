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
    int x = 0xffffffff;
    struct timespec start, finish; 
    clock_gettime(CLOCK_REALTIME, &start); 

    // chew up some CPU time
    int i,j; for (i=0,j=0; i<100000000; i++) { j+=i*i; }     

    clock_gettime(CLOCK_REALTIME, &finish); 

    x = 0xffeeffee;
    long seconds = finish.tv_sec - start.tv_sec;
    x = 0xaaeeaaee;
    long ns = finish.tv_nsec - start.tv_nsec; 
    x = 0x11223344;
    
   
    printf("seconds without ns: %ld\n", seconds); 
    printf("nanoseconds: %ld\n", ns); 
    printf("total seconds: %e\n", (double)seconds + (double)ns/(double)1000000000); 
} 

