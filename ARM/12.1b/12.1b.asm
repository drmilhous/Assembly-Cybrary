.data
.balign 4
message: .asciz "The value is %lf\n"
.balign 4
//x .float 3.14
a: .double 1.1, 2.2, 3.3, 4.4
b: .double  5.0,6.0,7.0,8.0
.text
.global main
.global print_int
.global printf

.func main
main:
    	push {fp,lr}
    	add fp, sp, #4
	sub sp, sp, #40
	mov r5, #0b011                        /* r5 ← 3 */
    	mov r5, r5, LSL #16                   /* r5 ← r5 << 16 */
    	fmrx r4, fpscr                        /* r4 ← fpscr */
    	orr r4, r4, r5                        /* r4 ← r4 | r5 */
    	fmxr fpscr, r4                        /* fpscr ← r4 */
	fmrx r2, fpscr
	ldr r3, =0x00c00000
	bic r2,r2,r3
	ldr r3, =0x00030000
   	orr  r2,r2,r3   //stride == 1 len== 4
	fmxr fpscr, r2
	vmrs r2, fpscr
	// prologue
	//load a into d8-d11
    	ldr r1, =a
	ldrd r2, [r1]
	strd r2, [fp, #-12]
	vldr.f64 d8, [fp, #-12]
	
	ldrd r2, [r1,#8]
	strd r2, [fp, #-12]
	vldr.f64 d9, [fp, #-12]
	
	ldrd r2, [r1,#0x10]
	strd r2, [fp, #-12]
	vldr.f64 d10, [fp, #-12]
	
	ldrd r2, [r1,#0x18]
	strd r2, [fp, #-12]
	vldr.f64 d11, [fp, #-12]
	
	//load b into d12-d15
    	ldr r1, =b
	ldrd r2, [r1]
	strd r2, [fp, #-12]
	vldr.f64 d12, [fp, #-12]
	
	ldrd r2, [r1,#8]
	strd r2, [fp, #-12]
	vldr.f64 d13, [fp, #-12]
	
	ldrd r2, [r1,#0x10]
	strd r2, [fp, #-12]
	vldr.f64 d14, [fp, #-12]
	
	ldrd r2, [r1,#0x18]
	strd r2, [fp, #-12]
	vldr.f64 d15, [fp, #-12]

	vmrs r10,fpscr 
   	bic  r10,r10,#0x00370000
   	orr  r10,r10,#0x00030000   //stride == 1 len== 4
    	vmsr fpscr,r10
	
x:	vadd.f64 d7,d12,d15

y:	mov r2, #7
	mov r3, #0xA
	ldr r2, [r8]
	ldr r3, [r8,#4]
	strd r2, [fp,#-20]
	vldr d6, [fp, #-20]
	vldr d8, [fp, #-12]
	vmul.f64 d6,d8,d6
	vstr d6, [fp,#-12]
  	ldrd r2, [fp, #-12]
    	ldr r0, =message
   	bl printf
	//epilogue
	sub sp, fp, #4
   	pop {fp,lr}
    	bx lr
