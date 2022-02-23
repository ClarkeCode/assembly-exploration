@ARM assembly
@A version of greeting.s that uses the Link Register (LR) for making functions

.text
.global _start

print:
	mov r7, #4 @ write syscall
	mov r0, #1 @ write to standard output
	swi 0      @ invoke syscall
	bx  lr     @ return to where the branch was initiated 

_start:
	LDR R1, =prompt  @ pointer to the string
	MOV R2, #20      @ length of message
	bl  print

	MOV R7, #3 @read syscall
	MOV R0, #0
	LDR R1, =input
	MOV R2, #100
	SWI 0

	ldr r1, =response
	mov r2, #18
	bl  print

	ldr r1, =input
	mov r2, #100
	bl  print

	@invoke exit syscall
	MOV R7, #1
	SWI 0

.data
prompt:
	.asciz "Hello, who are you? "
response:
	.asciz "Good to meet you, "
input: .skip 100
