@ARM assembly

.text
.global _start


_start:
	MOV R7, #4       @ write syscall
	MOV R0, #1       @ output to console
	LDR R1, =prompt  @ pointer to the string
	MOV R2, #20      @ length of message
	SWI 0

	MOV R7, #3 @read syscall
	MOV R0, #0
	LDR R1, =input
	MOV R2, #100
	SWI 0

	mov r7, #4
	mov r0, #1
	ldr r1, =response
	mov r2, #18
	swi 0

	mov r7, #4
	mov r0, #1
	ldr r1, =input
	mov r2, #100
	swi 0

	@invoke exit syscall
	MOV R7, #1
	SWI 0

.data
prompt:
	.asciz "Hello, who are you? "
response:
	.asciz "Good to meet you, "
input: .skip 100
