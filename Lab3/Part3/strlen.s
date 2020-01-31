.text
.align 4 /* code alignment */
.global strlen

.type strlen, %function

strlen:

    sub r0, r0, #1 /* for first iteration of loop */
    mov r2, #0 /* initialize to zero */

strlen_loop:
    ldrb r1, [r0, #1]!
    cmp r1, #0
    beq exit
    add r2, r2, #1
    b strlen_loop

exit:
    mov r0, r2
    bx lr

.data
