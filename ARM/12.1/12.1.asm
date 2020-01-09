.data
.balign 4
message: .asciz "Test this String output!\n"
a: .int 134
b: .int 9
c: .int 3
d: .long 1234567890
.text
.global main
.global print_int
.func main
main:
    	push {lr}
	// code here
	ldr r0, =a
	ldrd r2, [r0]
	vmov.u32 q0, #0
	vmov.s32 s0, r2
	//vmov.s32 d0, s0
	//vmovl.s32 q0, d0
	//vmovl.s32 q0, d0
	//vcvt.s32.s128

	vmov.u32 q1, #0
	ldr r0, =d
	ldrd r2, [r0]
	vmov.i32 s4, r2
	
	vmul.s32 q2,q0,q0
	//vmul.s32 {q2-q4},q1,d0[0]
	//vqadd.u32 q2,q0,q1
	

	ldr r0, =c
	ldrd r2, [r0]
	vmov.i32 s8, r2

//	vadd.i32 s10, s11
	//vdiv.f32 s13, s10, s11 // s12 = s10/s11
/*	vsub.f32 s13, s10, s11 // s12 = s10-s11
	vnmul.f32 s14, s11, s12	
	vabs.f32 s15, s14	
	vmov s19, s12
	
	vmla.f32 s19, s19, s19
	
	ldr r0, =pi
	ldrd r2, [r0]
	vmov.f32 s0,r2

	ldr r0, =one
	ldrd r2, [r0]
	vmov.f32 s2, r2
	vadd.f32 s0, s0,s2

	ldr r0, =ten
	ldrd r2, [r0]
	vmov.f32 s1, r2
	vmul.f32 s3, s0,s1 
*/
   	pop {lr}
    	bx lr
