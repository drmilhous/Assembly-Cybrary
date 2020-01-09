.data
.balign 4

.text
.global main
.func main
main:
	/*Here is a comment*/
	push {lr,fp}
	vldr.i32 s0, =0x00000002
	vldr.i32 s1, =0x00000004
	
	vldr.i32 s2, =0x00000003
	vldr.i32 s3, =0x00000007
	

	//vmla.i16 d2, d1, d0[3]
	vmul.i32 d1, d0
	sub fp, sp, #20
	vstr d1, [fp,#20]

	mov r0, #7
	pop {lr,fp}
	bx lr
	// This is a comment too
