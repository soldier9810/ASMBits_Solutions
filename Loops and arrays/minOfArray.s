// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl min
    b _start        // End of testing code

// Return minimum element of signed array
min:
	sub r0, r0, #1
    ldr r2, [r1, r0, lsl #2]
    push {lr}
    sub r0, r0, #1
    bl loop
    mov r0, r2
    pop {pc}
    
loop:
	cmp r0, #0
    bxlt lr
    ldr r3, [r1, r0, lsl #2]
    cmp r2, r3
    movgt r2, r3
    sub r0, r0, #1
    b loop