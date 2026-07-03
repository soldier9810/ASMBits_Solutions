.data
MyString: .string "Hello World"

.text
.global _start
_start:
    ldr r0, =MyString
    bl strlen
    1: b 1b

.global strlen
strlen:
	push {lr}
	mov r1, #0
	bl count
    mov r0, r1
    pop {pc}
count:
	ldrb r2, [r0, r1]
    tst r2, #0xff
    addne r1, r1, #1
    bne count
    bx lr