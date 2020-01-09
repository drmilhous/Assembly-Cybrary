.syntax unified
.data
.balign 4
message: .asciz "\n"

.text
.global main
.global print_int
.func main
main:
    push {lr}
    @add r1,#4
    ldr r0,[r1, #8] 

    bl print_string
    ldr r0, =message
    bl print_string
    mov r1, 1
    mov r2 , 3
    mov r0, 5
    blx foo
    bl print_int
    pop {lr}
    bx lr

.balign 2
.thumb_func
foo:
	push {lr}
bar:	mov r0,r1
	adds r0, r2
	bx lr
