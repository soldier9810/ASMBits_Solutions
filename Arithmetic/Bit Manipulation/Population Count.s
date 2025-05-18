// A test case to test your function with
.global _start
_start:
    mov r0, #5
    bl popcount
    1: b 1b    // Done

// Only your function (starting at popcount) is judged. The test code above is not executed.
popcount:
	push {lr}
	mov r1, #0x1
    mov r2, #0
    mov r3, #0
    bl count
    pop {lr}
    mov r0, r2
    bxge lr
    
 
count:
	tst r1, r0
    addne r2, r2, #1
    lsl r1, r1, #1
    add r3, r3, #1
    cmp r3, #32
    bxge lr
    b count