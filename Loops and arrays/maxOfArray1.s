// A test case to test your function with
.data
Array: .byte 1, 2, 3

.text
.global _start
_start:
    ldr r0, =3 
    ldr r1, =Array
    bl max
    b _start        // End of testing code

// Return maximum element of unsigned array
max:
	push {lr}
	ldr r2, =0x80000000
    sub r0, r0, #1
    bl loop
    mov r0, r2
    pop {pc}
    
loop:
	cmp r0, #0
    bxlt lr
	ldrb r3, [r1, r0]
    lsl r3, #24
    asr r3, #24
    cmp r3, r2
    movgt r2, r3
    sub r0, r0, #1
    b loop