.data
.balign 4
message: .asciz "Test this String output!\n"

.text
.global main
.global print_int
.func main
main:
    	push {lr}
	//code here
    	pop {lr}
    	bx lr
