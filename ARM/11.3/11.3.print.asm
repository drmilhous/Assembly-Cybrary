.data
.balign 4
x : .word 35
.text
.global main
.global print_int
.func main
main:
	push {lr}
	ldr r1, =x    // get address
	ldr r1,[r1]   // load data
	mov r2, #7    // mov 7
	add r0, r1,r2 // Do math
	bl print_int  // print result
	pop {lr}
    	bx lr
