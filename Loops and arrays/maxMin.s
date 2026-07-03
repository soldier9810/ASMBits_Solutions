// A test case to test your function with
Array: .word 1, 2, 3

.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl peak
    b _start        // End of testing code

// Return the difference between max and min array elements
peak:
	ldr r2, [r1], #4
	mov r3, r2
    subs r0, r0, #1
    push {r4}
    beq done

loop:
    ldr r4, [r1], #4
    cmp r4, r2
    movlt r2, r4
    
    cmp r4, r3
    movgt r3, r4
    
    subs r0, r0, #1
    bne loop

done:
	pop {r4}
	sub r0, r3, r2
    bx lr