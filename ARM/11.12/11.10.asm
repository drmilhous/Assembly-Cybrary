.data
.balign 4
message: .asciz "abc def ghi jkl!\n"
message1: .skip 100
.text
.global main
.global print_int
.func main
main:
    	push {lr}
    	ldr r0, =message
    	ldr r5, =message1
	
	ldm r0, {r1-r4}
	stm r5, {r1-r4}
	
    	ldr r0, =message
	ldm r0!,{r1,r2}
	ldm r0!,{r3,r4}
    	ldr r0, =message
	stm r0!, {r3,r4}
	stm r0!, {r1,r2}


		
	
    	ldr r0, =message
    	bl print_string
    	ldr r0, =message1
    	bl print_string
    	pop {lr}
	bx lr
