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
	vldr.i32 s0, =0x12345678
	vldr.i32 s1, =0xa1b1c1d1
	vldr.i32 s2, =0x10000005
	vldr.i32 s3, =0x10000007
	ldr r0, =array
	vmovl.u8 q9, d0
	vmovl.u16 q10, d0
	//vld1.16 {d2}, [r0]
	//vaddl.s16  q2, d2, d1
	mov r0, #0
    	pop {lr}
    	bx lr
