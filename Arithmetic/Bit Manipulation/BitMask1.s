.global _start
_start:
	ldr r0, =4
	bl mask
1:	b 1b    // Done

mask:
	mov r1, #1
    lsl r1, r1, r0
    sub r0, r1, #1
	bx lr