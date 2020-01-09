.data
.balign 4
message: .asciz "Test this String output!\n"
out: .asciz "%.17g"
pi: .float 3.1415
big: .float 100.0
.text
.global main
.global printf
.func main
main:
    	push {lr}
	// code here
	ldr r0, =pi
	ldrd r2, [r0]
	vmov.f32 s0,r2
	vcvt.f64.f32 d0,s0

	ldr r0, =big
	ldrd r2, [r0]
	vmov.f32 s2,r2
	vcvt.f64.f32 d1,s2
	
	vmul.f64 d2,d1,d0
	vmov.f64 r2,r3,d2
	strd	r2, [fp, #-12]
   	ldrd	r2, [fp, #-12]
	ldr r0, =out
	bl printf

   	pop {lr}
    	bx lr
