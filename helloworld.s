@ARM assembly
@Following Derek Banas's tutorial video - https://youtu.be/ViNnfoE56V8?t=1326

.text
.global _start


_start:
	MOV R7, #4       @ write syscall
	MOV R0, #1       @ output to console
	MOV R2, #24      @ length of message
	LDR R1, =message
	SWI 0

end:
	MOV R7, #1
	SWI 0

.data
message:
	.asciz "Hello (assembled) world!\n\r"
