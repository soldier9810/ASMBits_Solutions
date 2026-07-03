.global _start
_start:
	ldr r0, =4
	ldr r1, =2
	bl mask
1:	b 1b    // Done

mask:
	mov r2, #1
    mov r3, #1
    rsb r0, r3, r2, lsl r0
    rsb r1, r3, r2, lsl r1
    eor r0, r0, r1
    bx lr