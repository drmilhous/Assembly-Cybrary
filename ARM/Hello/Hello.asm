.data
.balign 4
message: .asciz "Test this String output!\n"

#.cpu arm7t
#.syntax unified

.text
.code 16     /* Here we say we will use Thumb */
.align 2     /* Make sure instructions are aligned at 2-byte boundary */
 
.syntax unified
.func thumb_function
thumb_function:
	mov r1, #3
	cmp r0, #1
    	#moveq r0, #100   /* r0 ← 2 */
	ITE NE          
	movne R0, #1   
	muleq R0, R1, R0 
    bx lr        /* return */
.endfunc
.code 32 
.align 4
.global main
.global print_int
.func main
main:
	push {lr}
	ldr r0, =message
	bl read_int
#	cmp r0, #0
#	addne r0, #20
#	movne r1, #7
#	mulne r0, r1,r0
	
	blx thumb_function
	bl print_int
	pop {lr}
   	bx lr
/*.code 16
.align 2
foo:
	mov r2, #7
	cmp r0, #1
	
	ITT EQ
	addeq r0, #1
	muleq r0, r2,r0
	bx lr
*/	
