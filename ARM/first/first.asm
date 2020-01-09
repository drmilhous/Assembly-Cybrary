.data
.balign 4
message: .asciz "Test this String output!\n"

.text
.global main
.global print_int
.func main
main:
	mov r0, #2
    	bx lr
