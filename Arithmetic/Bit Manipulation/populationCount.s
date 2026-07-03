// A test case to test your function with
.global _start
_start:
    mov r0, #5
    bl popcount
    1: b 1b    // Done

// Only your function (starting at popcount) is judged. The test code above is not executed.
popcount:
	push {lr}
    mov r1, #0
    mov r2, #0
    bl count
    pop {lr}
    mov r0, r2
    bxge lr
 
count:
	tst r0, #1
    addne r2, r2, #1
    lsr r0, r0, #1
    add r1, r1, #1
    cmp r1, #32
    bxge lr
    b count