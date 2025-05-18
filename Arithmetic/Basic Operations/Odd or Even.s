.global _start
_start:
    mov r0, #1
    bl odd
    1: b 1b    // Done

.global odd
odd:
	tst r0, #0x1
	moveq r0, #0
    movne r0, #1
    bx lr
	