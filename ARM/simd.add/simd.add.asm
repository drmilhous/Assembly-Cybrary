.data
.balign 4
input: .asciz "THIS IS A TEST"
.text
.global main
.func main
main:
	push {fp,lr}
	sub fp, sp, #20
	ldr r0, =input
	ldrd r2, [r0]
	strd r2, [fp,#4]
	vldr.s32 d0, [fp, #4]
	add r0, r0, #8
	ldrd r2, [r0]
	strd r2, [fp,#4]
	vldr.s32 d1, [fp, #4]
	
	ldr r0,=0x01010202  
	vdup.u8 d4, r0

	vadd.i8 d8,d0,d4 
	#vpadd.i8 d8,d0,d4 
	
	
	mov r0, #7
	pop {fp,lr}
	bx lr
	// This is a comment too
