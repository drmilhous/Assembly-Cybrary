.data
.balign 4
message: .asciz "Test this String output!\n"

.text
.global main
.global print_int
.func main
main:
    mov r0, r1

    ldr r0, =message
    push {lr}
    push {r0-r1}
    bl print_string
    mov r0, #3      /* r0 ← 3 */
    mov r1, #4      /* r1 ← 4 */
    add r0, r0, r1  /* r0 ← r0 + r1 */
    bl print_int
	pop {r1-r8}
    pop {lr}
    bx lr
