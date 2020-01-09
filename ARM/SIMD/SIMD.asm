.data
.balign 4
message: .asciz "Test this String output!\n"
.balign 1
array: .hword 0x1, 0x2, 0x3,0x4 
value: .word 0x3, 0x5, 0x7,0xB
.text
.global main
.global print_int
.func main
main:
    	push {lr}
	ldr r4, =value
	vldr.f32 s0, =0x10000001
	vldr.f32 s1, =0x10000003
	vldr.f32 s2, =0x10000005
	vldr.f32 s3, =0x10000007
	ldr r0, =array
	vld1.16 {d2}, [r0]
	vaddl.s16  q2, d2, d1
	mov r0, #0
    	pop {lr}
    	bx lr
