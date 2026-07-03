// Some testing code
// You may uncomment these during testing
// add_a: bx lr
// add_b: bx lr
// add_c: bx lr
// add_d: bx lr
// add_e: bx lr
// done: bx lr

.global _start
_start:
	ldr r0, =5    // First function parameter is always passed through r0.
	bl build
	1: b 1b    // Done

build:
	// Because there are nested function calls, lr needs to be saved and restored.
	push {lr}

	// Your code here
    mov r1, #0
    
	tst r0, #16
    movne r1, #16
    tst r0, #8
    movne r1, #8
    tst r0, #4
    movne r1, #4
    tst r0, #2
    movne r1, #2
    tst r0, #1
    movne r1, #1
    
    tst r1, #1
    blne add_a   
    tst r1, #2
    blne add_b
    tst r1, #4
    blne add_c
    tst r1, #8
    blne add_d
    tst r1, #16
    blne add_e
    
    bl done
	// Restore lr and return.
	pop {pc}