.data
.balign 4
input: .asciz "%d"
output: .asciz "The value is %d\n"
a: .int 123
b: .int 9
c: .int 3

.text
.global main
.global printf
.global scanf
.func main
main:
    	push {fp,lr}
	//code here
	add fp, sp, #4
	sub sp, sp, #10
	
	sub r1, fp, #8 //read 1st number
	ldr r0, =input
	bl scanf
	
	ldr r0, [fp, #-8]
	ldr r1, =a
	str r0, [r1]

	ldr r0, =a
	ldrd r2, [r0]
	vmov.i32 s0, r2 //set d0 with a
	vldr.i32 s1, =0

	sub r1, fp, #8 //read 1st number
	ldr r0, =input
	bl scanf
	
	ldr r0, [fp, #-8]
	ldr r1, =b
	str r0, [r1]
	
	ldr r0, =b
	ldrd r2, [r0]
	vmov.i32 s2, r2 //set d1 with b
	vldr.i32 s3, =0	

	vmul.i32 d2, d1, d0 // multiply
	ldr r0, =c
	vstr d2, [r0] // save to C

	ldr r0, =c //print the result
	ldr r1, [r0]
	ldr r0, =output
	bl printf
	
	

	sub sp, fp, #4
    	pop {fp,lr}
    	bx lr
