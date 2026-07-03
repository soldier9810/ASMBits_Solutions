.data
Pointer: .word 1234
.text
.global _start
_start:
    ldr r0, =Pointer
    bl load
    1: b 1b    // Done

.global load
load:
	mov r1, r0
	ldrb r0, [r1]
    ldrb r2, [r1, #1]
    orr r0, r0, r2, lsl #8
    ldrb r2, [r1, #2]
    orr r0, r0, r2, lsl #16
    ldrb r2, [r1, #3]
    orr r0, r0, r2, lsl #24
    bx lr