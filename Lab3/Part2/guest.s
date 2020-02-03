.text 
.align 4 /* code alignment */
.global main
.extern tcsetattr
.extern printf
.extern fncntl

frequency_detector:
    push {r4, r7}
    ldr r0, =string
    ldr r3, =arr
    mov r1, #0

frequency_detector_loop:
    ldrb r2, [r0, r1] /* loads the character of the string with offset r1 */
    cmp r2, #10 /* since we have canonical input, the last useful char will be EOL */
    beq frequency_detector_end
    ldrb r4, [r3, r2] /* loads the value in the array with offset r2 (character that we read) */
    add r4, r4, #1 /* increment the times seen the character */
    strb r4, [r3, r2] /* save the value */
    add r1, r1, #1 /* move to the next char of our string */
    b frequency_detector_loop

frequency_detector_end:
    mov r7, r1 /* save number of chars of the string (debugging only) */
    mov r1, #0 
    mov r0, #0
    ldr r3, =arr /* load array to r3 */

frequency_detector_end_loop:
    cmp r1, #32 /* 32 is the empty char (space), we ignore it */
    addeq r1, r1, #1
    ldrb r2, [r3, r1] /* Load value of array with offset r1*/ 
    cmp r0, r2 /* r0 holds the largest number seen */
    movlt r4, r1 /* if we find a char seen more times, we save the char */
    movlt r0, r2 /* and the times seen */
    add r1, r1, #1 
    cmp r1, #256 /* When we reach the end of the array, exit */
    beq frequency_detector_exit
    b frequency_detector_end_loop

frequency_detector_exit:
    mov r1, r4
    mov r2, r7
    pop {r4, r7}
    bx lr

main:

open:
    ldr r0, =path /* device to open */
    ldr r1, =#258 /* permissions blocking */
    mov r7, #5 /* num of open syscal is 5 */
    swi 0

    /* now r0 has the fd */
    mov r6, r0 /* save for later */

termios_setup:
    mov r0, r6 /* call tclsetattr to set the settings for our port */
    ldr r2, =options
    mov r1, #0
    bl tcsetattr

read:
    mov r0, r6
    ldr r1, =string
    mov r2, #64
    mov r7, #3
    swi 0

    mov r8, r0 /* save the number of chars read (for debugging only) */


    bl frequency_detector
    /* Now r0 holds the number of times char showed up  */
    /* r1 holds the character */
    /* r2 holds the number of bytes read (for debugging purposes) */
    /* save the values in our res array */
    /* since array is filled with the char 0, we need to find the actual number of occurances of the char so we subtract with the ASCII code */
    sub r0, r0, #48
    ldr r3, =res
    strb r1, [r3]
    strb r0, [r3, #2]
    strb r2, [r3, #1]
    

write:
    mov r0, r6
    ldr r1, =res
    ldr r2, =len_res 
    mov r7, #4
    swi 0

close:
    mov r0, r6
    mov r7, #6
    swi 0

exit:
    mov r0, #0
    mov r7, #1
    swi 0

.data
    options: .word 0x00000000 /* c_iflag */
             .word 0x00000004 /* c_oflag */
             .word 0x000008bd /* c_cflag */
             .word 0x00000a22 /* c_lflag */
             .byte 0x00       /* c_line */
             .word 0x00000000 /* c_cc[0-3] */
             .word 0x0064ff00 /* c_cc[4-7] */
             .word 0x00000000 /* c_cc[8-11] */
             .word 0x00000000 /* c_cc[12-15] */
             .word 0x00000000 /* c_cc[16-19] */
             .word 0x00000000 /* c_cc[20-23] */
             .word 0x00000000 /* c_cc[24-27] */
             .word 0x00000000 /* c_cc[28-31] */
             .byte 0x00       /* padding */
             .hword 0x0000    /* padding */
             .word 0x0000000d /* c_ispeed */
             .word 0x0000000d /* c_ospeed */
    
    path: .ascii "/dev/ttyAMA0"
    
    string: .asciz "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
    
    arr: .ascii "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    
    res: .ascii "a e\n\0"
    
    len_res = . - res
    
    string_2: .asciz "Helloman\n"
    
    len = . - string_2
    
    string_3: .asciz "Value is: %d\n"

    test: .byte 0x00
