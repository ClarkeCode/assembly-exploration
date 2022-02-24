@ARM assembly
@Uses the stack to pass values to a simple function

.text
.global _start

@Adds three numbers together and adds two
addplustwo:
	pop {R0, R1, R2}

	ADD R0, R1, R0
	ADD R0, R2, R0
	ADD R0, R0, #2
	push {R0}

	bx lr

_start:
	mov R0, #7
	mov R1, #6
	mov R2, #10

	@ push the register content onto the stack and wipe the registers to 
	@ ensure that we are really using the stack properly
	push {R0, R1, R2}
	mov R0, #0
	mov R1, #0
	mov R2, #0

	bl addplustwo
	pop {R0}

	@invoke exit syscall
	MOV R7, #1
	SWI 0
