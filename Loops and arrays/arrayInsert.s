.data 
// Leave some space for the expanded array
Array: .word 1, 2, 3, 4, 0xff, 0xff

.text
.global _start
_start:
    ldr r0, =Array
    ldr r1, =4
    ldr r2, =2
    ldr r3, =123
    bl array_insert
    1: b 1b    // Done

array_insert:
	cmp r1, r2
    beq done
	push {r4, r5}
    sub r5, r1, #1

loop:
	ldr r4, [r0, r5, lsl #2]
    str r4, [r0, r1, lsl #2]
    sub r5, r5, #1
    sub r1, r1, #1
    cmp r1, r2
    bne loop
    pop {r4, r5}
    
done:
	str r3, [r0, r2, lsl #2]
    bx lr