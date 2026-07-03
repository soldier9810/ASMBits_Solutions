.data
.byte 0    // Strings aren't word-aligned
MyString: .string "Hello World"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strtolower
    1: b 1b

.global strtolower
strtolower:
	push {lr}
    mov r1, #0
    bl check
    pop {pc}
    
check:
	ldrb r2, [r0, r1]
    tst r2, #0xff
    bxeq lr
    cmp r2, #0x5a
    push {lr}
    blls uppercase
    pop {lr}
    add r1, r1, #1
    b check
    
uppercase:
	cmp r2, #0x40
    addhi r2, r2, #0x20
    strb r2, [r0, r1]
    bx lr