.global _start
_start:
	ldr r0, =4
	ldr r1, =2
	bl mask
1:	b 1b    // Done

mask:
	mov r2, #1
    mov r3, #1
    lsl r2, r2, r0
    lsl r3, r3, r1
    sub r2, r2, #1
    sub r3, r3, #1
    eor r0, r2, r3
    bx lr