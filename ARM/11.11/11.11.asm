.data
.balign 4
message: .asciz "Test this String output! You will see how the data is loaded\n"

.text
.global main
.global print_int
.func main
main:
    push {lr}
    ldr r0, =message
    bl print_string
    
    ldmia r0!, {r1-r9}

    // r0 points to the message
    bl print_string
    pop {lr}
    bx lr
