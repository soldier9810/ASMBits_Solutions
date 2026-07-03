// A test case to test your function with
.global _start
_start:
    ldr r0, =2       // 2 = sign extend 8->32
    ldr r1, =0xf0    // The number to extend
    bl extend
    b _start        // End of testing code

// A function to extend. Only this part will be tested.
extend:
	cmp r0, #0
    andeq r0, r1, #0xff
    bxeq lr
    
    ldr r2, =0xffff
    cmp r0, #1
    andeq r0, r1, r2
    bxeq lr
    
    cmp r0, #2
    lsleq r0, r1, #24
    asreq r0, r0, #24
    bxeq lr
    
    cmp r0, #3
    lsleq r0, r1, #16
    asreq r0, r0, #16
    bx lr