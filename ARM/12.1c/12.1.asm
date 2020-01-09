.data
.balign 4
message: .asciz "The value is %lf\n"
.balign 2
//x .float 3.14
bill: .double 3.14
two: .double 2.0
fred:  .float 3.14, 2.3456
ted: .float 1.1,2.2
.text
.global main
.global print_int
.global printf

.func main
main:
    push {fp,lr}
    add fp, sp, #4
	sub sp, sp, #40
    	ldr r1, =bill
	ldr r2, [r1]
    	ldr r3, [r1,#4]
	strd r2, [fp, #-12]
	mov r2, #7
	mov r3, #0xA
	ldr r8, =two
	ldr r2, [r8]
	ldr r3, [r8,#4]
	strd r2, [fp,#-20]
	vldr d6, [fp, #-20]
	vldr d8, [fp, #-12]
	vmul.f64 d6,d8,d6
	vstr d6, [fp,#-12]
  	ldrd r2, [fp, #-12]
   // add r3,r3,#8
    //vldr d2, [r3]
   // ldr r8, =ted
   // vstr d1,[r8] 
   // ldrd r2, [r8]
    ldr r0, =message
    bl printf
	sub sp, fp, #4
    pop {fp,lr}
    bx lr
