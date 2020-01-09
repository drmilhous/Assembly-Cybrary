.data
.balign 4
formatA: .asciz "%f"
formatB: .asciz "Value = %f\n"
x: .float 9.9
y: .float 3.134
.text
.global main
.global scanf
.global printf
.func main
main:
	push {fp,lr}
	add fp, sp, #4
	sub sp, sp, #24
	sub r1,fp, #8
	ldr r0, =formatA
	bl scanf
	vldr s15, [fp, #-8]
   	vcvt.f64.f32 d7, s15
   	vmov  r2, r3, d7
	ldr r0, =formatB
	bl printf
	sub sp, fp, #4
	pop {fp,lr}
	bx lr
	// This is a comment too
