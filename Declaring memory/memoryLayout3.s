// Declare something
.data
Data: .word Node1
Node1: .word Node2
Node2: .word 0x12345

.text
.global _start
_start:
	ldr r0, =Data
	ldr r1, [r0]
	ldr r2, [r1]
	ldr r3, [r2]
    1: b 1b    // Done