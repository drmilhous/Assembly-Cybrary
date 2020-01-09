.data
.balign 4
message: .asciz "Test this String output!\n"
message2: .asciz "Nothing to see here, just a bunch of characters"
.text
.global main
.global print_int
.global putchar
.func main
main:
    push {lr}
    ldr r1, =message
    ldr r5, =message2
    mov r2,r1
    mov r2, #0 // null terminator
top:
 
    	ldrb r0, [r1], #1
	//and r0,r0, #0xFF
	strb r0, [r5], #1 
	#add r0, r0, #1
	cmp r0,r2
	beq done
    	b top

done:
    ldr r0, =message2
    bl print_string
    pop {lr}
    bx lr
