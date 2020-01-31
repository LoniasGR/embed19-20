.text 
.global main


reformat_string:
    push {r0, r1, r2, r5, lr}
    sub r1, r1, #1 /* subtract one from r1 for the loop to function correctly at first iteration*/
/* we can't have 0 input characters, so we don't care about this case */

reformat_string_loop:     
    add r1, r1, #1
    ldrb r0, [r1]
    cmp r0, #57 /* 9 in ascii */
    bgt reformat_letter
    cmp r0, #48 /* 0 in ascii */
    bge reformat_number
    b reformat_string_loop_continue

reformat_letter:
    cmp r0, #65 /* ASCII for A */
    blt reformat_string_loop_continue
    cmp r0, #90 /* ASCII for Z */
    bgt reformat_small_letter
    bl reformat_capital_letter


reformat_capital_letter:
    add r0, #32 /* Transform to small by adding 32 */
    bl reformat_string_loop_continue

reformat_small_letter:
    cmp r0, #97 /* a in ascii */
    blt reformat_string_loop_continue
    cmp r0, #122 /* z in ascii */
    bgt reformat_string_loop_continue
    sub r0, #32 /* remove 32 to transform to capital */
    bl reformat_string_loop_continue

reformat_number:
    sub r0, #48 /* remove acii 0 to get actual number */
    add r0, #5 /* add 5 */
    cmp r0, #10 /* if number over 10, remove 10 */
    subge r0, #10
    add r0, #48 /* add ascii back */
    bl reformat_string_loop_continue

reformat_string_loop_continue:
    strb r0, [r1]
    subs r5, r5, #1 /* Loop iterator*/
    blne reformat_string_loop 
    
reformat_string_cleanup:
    pop {r0, r1, r2, r5, lr}
    bx lr
    
main:
    ldr r1, =output_string /* second argument -> memory location of output string */
    mov r2, #len /* third argument -> number of bytes */
    mov r0, #1 /* first argument -> stdout */
    mov r7, #4 /* number of system call */
    swi 0    
    
    ldr r1, =inp_str /* second argument -> memory where input string will be stored */
    mov r2, #32 /* third argument -> number of bytes to be read */    
    mov r0, #0 /* first argument -> stdin */
    mov r7, #3 /* number of read syscall */
    swi 0
    
    /* Check if we get quit code */
    cmp r0, #2 /* First check the length - 2 characters ('q\n' or 'Q\n') */
    bne no_exit
    ldrb r5, [r1]
    cmp r5, #81 /* Compare with Q */
    beq exit
    cmp r5, #113 /* Compare with q */
    beq exit

no_exit:

    mov r5, r0 /* store the value of length of the result */
    bl reformat_string  
    
    cmp r5, #32
    bne print_result

    add r5, r5, #1
    mov r6, #10   
    strb r6, [r1, #31]

print_result:
    ldr r1, =output_string_2 /* second argument -> memory location of output string */
    mov r2, #len_2 /* second argument ->  number of bytes */
    mov r0, #1 /* first argument -> stdout */
    mov r7, #4 /* number of system call */
    swi 0

    /* Print changed input */
    ldr r1, =inp_str /*  second argument -> memory location of output string */
    mov r2, r5 /* third argument -> number of bytes print */
    mov r0, #1 /* first argument -> stdout */
    mov r7, #4 /* number of system call */
    swi 0   

    cmp r5, #32
    blt main 

clear_input:
    /* Clear any leftover input */
    ldr r1, =inp_str /* second argument -> memory where input string will be stored */
    mov r2, #32 /* third argument -> number of bytes to be read */    
    mov r0, #0 /* first argument -> stdin */
    mov r7, #3 /* number of read syscall */
    swi 0
    cmp r0, #32 /* First check the length - 2 characters ('q\n' or 'Q\n') */
    bne main
    ldrb r6, [r1, #32]
    cmp r6, #10
    beq clear_input

    b main

exit:
    mov r0, #0 /* exit status 0 */
    mov r7, #1 /* number of exit syscall */
    swi 0

.data
    output_string: .ascii "Input a string of up to 32 chars long: " /* location of output string in memory */
    len = . - output_string /* length of output string */
    output_string_2: .ascii "Result is: "
    len_2 = . - output_string_2
    inp_str: .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
