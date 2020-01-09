.data
.balign 4
message: .asciz "Test this String output!\n"
array:  .word 1
	.word 2
	.word 3
	.word 4
	.word 5
.text
.global main
.global print_int
.func main
main:
    	push {lr}
	ldr r2, =array
	ldr r0, [r2, #8]! //pre-indexed  R0 = *(R2+8)  R2 = R2+8
	ldr r2, =array
	ldr r0, [r2, #8]  //offset       R0 = *(R2+8)  R2 = R2
	ldr r2, =array
	ldr r0, [r2], #8  //post-indexed R0 = *(R2+0)  R2 = R2+8
    	pop {lr}
    bx lr
