.data
.balign 4
message: .asciz "Test this String output!\n"

.text
.global main
.global print_int
.func main
main:
    push {lr}
	mov r1, #1
	push {r1}
	add r1, #1
	push {r1}
	add r1, #1
	push {r1}
	ldr r0, [sp,#0xC]
    	bl print_int
	add sp, #8
    pop {lr}
    bx lr
