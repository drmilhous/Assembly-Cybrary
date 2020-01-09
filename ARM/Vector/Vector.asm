.data
.balign 4
message: .asciz "Test this String output!\n"
pi: .float 3.1415
ten: .float 10.0
one: .float 1.0
a: .float 134
b: .float 9
c: .float 3
.text
.global main
.global print_int
.func main
main:
    	push {lr}
	// code here
	ldr r0, =a
	ldrd r2, [r0]
	vmov.f32 s10, r2
	
	ldr r0, =b
	ldrd r2, [r0]
	vmov.f32 s11, r2


	ldr r0, =c
	ldrd r2, [r0]
	vmov.f32 s12, r2

	//vdiv.f32 s13, s10, s11 // s12 = s10/s11
	vsub.f32 s13, s10, s11 // s12 = s10-s11
	vnmul.f32 s14, s11, s12	
	vabs.f32 s15, s14	
	vmov s19, s12
	
	vmla.f32 s19, s19, s19
	
	//vldr.f32 s9, =#9.0001	

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

   	pop {lr}
    	bx lr
