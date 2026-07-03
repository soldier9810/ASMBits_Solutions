// A test case to test your function with
.global _start
_start:
    ldr r0, =0x123    // First parameter is always in r0
    bl saturate
    b _start        // End of testing code

// Convert signed 32 bit to 8 bit, with saturation
saturate:
	ldr r1, =0x7f
    cmp r0, r1
    movgt r0, #0x7f
    
    ldr r1, =0xffffff80
    cmp r0, r1
    movlt r0, #0x80
    and r0, r0, #0xff
    
    bx lr