.data
.balign 4

.text
.global main
.func main
main:
	/*Here is a comment*/
	vldr.i32 s0, =0x00020001
	vldr.i32 s1, =0x00040003
	
	vldr.i32 s2, =0x00050003
	vldr.i32 s3, =0x00090007
	
	vldr.i32 s4, =0xB000A000
	vldr.i32 s5, =0xD000C000

	vmla.i16 d2, d1, d0[3]
	//vmul.i16 d2, d1

	mov r0, #7
	bx lr
	// This is a comment too
