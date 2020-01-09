.data
.balign 4

.text
.global main
.global print_int
.func main
main:
    push {lr}
    mov r0, #103  // move 103 to r0 
    mvn r1, #2    // move 44 to r1
    add r0, r0, r1 // add r1 and r0 save to r0
mov r1, r0
mov r9, #32
mvn r1, #2

    bl print_int
    pop {lr}
    bx lr
