.data
.byte 0    // Test with an unaligned word.
Pointer: .word 1234
.text
.global _start
_start:
    ldr r0, =Pointer
    bl inc
    1: b 1b    // Done

.global inc
inc:
	ldrb r1, [r0]
    ldrb r2, [r0, #1]
    orr r1, r1, r2, lsl #8
    ldrb r2, [r0, #2]
    orr r1, r1, r2, lsl #16
    ldrb r2, [r0, #3]
    orr r1, r1, r2, lsl #24
    add r1, r1, #1
    strb r1, [r0]
    lsr r1, r1, #8
    strb r1, [r0, #1]
    lsr r1, r1, #8
    strb r1, [r0, #2]
    lsr r1, r1, #8
    strb r1, [r0, #3]
    bx lr