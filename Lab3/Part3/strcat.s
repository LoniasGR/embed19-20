.text
.align 4 /* code alignment */
.global strcat

.type strcat, %function

strcat:
    mov r3, r0 /* save the original position of dest */
    sub r0, r0, #1 /* this is for the first iteration of the loop */
    sub r1, r1, #1 /* this is for the first iteration of the loop */

end_of_dest:
    ldrb r2, [r0, #1]! /* load byte from r0 + 1 mem */
    cmp r2, #0 /* 0 is the ascii for no more chars */
    bne end_of_dest

strcat_loop:
    ldrb r2, [r1, #1]!
    strb r2, [r0], #1
    cmp r2, #0
    bne strcat_loop

exit: 
    mov r0, r3
    bx lr

.data
