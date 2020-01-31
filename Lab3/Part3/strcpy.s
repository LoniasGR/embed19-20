.text
.align 4 /* code alignment */
.global strcpy

.type strcpy, %function

strcpy:
    mov r3, r0 /* save for later */
    sub r1, r1, #1

strcpy_loop:
    ldrb r2, [r1, #1]!
    strb r2, [r0], #1
    cmp r2, #0
    bne strcpy_loop

exit:
    mov r0, r3
    bx lr
.data
