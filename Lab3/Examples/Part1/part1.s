.text 
.global main

read_number:
    push r7
    mov r0, #0 /* first argument -> stdin */
    mov r7, #3 /* number of read syscall */
    swi 0
    pop r7
    mov pc, lr

print_out_str:
/* we will use syscalls to interact with the user */
    push r7
    mov r0, #1 /* first argument -> stdout */
    mov r7, #4 /* number of system call */
    swi 0
    pop r7
    mov pc, lr

main:
    ldr r1, =output_string /* second argument -> memory location of output string */
    mov r2, #len /* third argument -> number of bites */
    
    bl print_out_str
    
    ldr r1, =inp_str /* second argument -> memory where input string will be stored */
    mov r2, #32 /* third argument -> number of bytes to be read */
    
    bl read_number
    
    mov r2, r0
    
    bl print_out_str

    
.data
    output_string: .ascii "Input a string of up to 32 chars long: " /* location of output string in memory */
    len = . - output_string /* length of output string */
    inp_str: .ascii "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"