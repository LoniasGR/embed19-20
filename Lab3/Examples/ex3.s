.text
.global main

decypher:
	stmfd sp!, {r3-r4, fp, lr} /* store in fully descending stack the values of r3, r4, fp and lr */
	mov r0, #2 /* decoding will be performed changing one word of memory at a time. This is why r0 which the loop index is 2 */
	ldr r1, =inp_str
	sub r1, r1, #4
	ldr r2, =passphrase
	add r2, r2, #8

loop:
	ldr r3, [r1, #4]! /* load in r3 one word from memory. The memory address is indicated by r1 plus four bytes. Update the value of r1 */
	ldr r4, [r2, #-4]! /* load in r4 one word from memory. The memory address is indicated by r2 minus four bytes. Update the value of r2 */
	add r3, r3, r4 /* subtract r4 from r3 */
	str r3, [r1] /* store the updated value of input phrase */
	subs r0, r0, #1 /* subtract one from index and update the flags */
	bne loop
	
	ldmfd sp!, {r3-r4, fp, lr} /* restore the values of r3, r4, fp and lr from stack*/
	bx lr /* branch to main program */
 
main:
	mov r0, #1 /* write system call */
	ldr r1, =string
	mov r2, #len
	mov r7, #4
	swi 0	

inp1:
	mov r0, #0 /* read system call */
	ldr r1, =passphrase
	mov r2, #8
	mov r7, #3
	swi 0
	cmp r0, #8
	bne inp1

	ldr r0, =in_file /* open system call, r0 will hold the file descriptor (fd_r) of the input file */
	mov r1, #0 /* O_RDONLY */
	mov r7, #5
	swi 0

	mov r3, r0 /* temporarily store the value of fd_r in r3 */
	
	/*r0 has fd_r, read system call*/
	ldr r1, =inp_str /* read the phrase to be decoded */
	mov r2, #8
	mov r7, #3
	swi 0

	ldr r0, =out_file /* open system call, r0 will hold the file descriptor (fd_w) of the output file */
	mov r1, #65 /* O_WRONLY | O_CREAT */
	mov r7, #5
	swi 0 

	mov r4, r0 /* temporarily store the value of fd_w in r4 */

	bl decypher	/* branch to subroutine, store program counter in link register */

	mov r0, r4 /* write system call, r4 holds fd_w */
	ldr r1, =inp_str
	mov r2, #9 /* print 8 bytes because there is the new line character pre-stored in the end of decoded string */
	mov r7, #4
	swi 0

	mov r0, r3 /*close fd_r*/
	mov r7, #6
	swi 0

	mov r0, r4 /*close fd_w*/
	mov r7, #6
	swi 0

	mov r0, #0 /* exit system call */
	mov r7, #1
	swi 0

.data
	string: .ascii "Please input an 8-string long passphrase : "
len = . - string
	inp_str: .ascii "\0\0\0\0\0\0\0\0\n"
	passphrase: .ascii "\0\0\0\0\0\0\0\0"
	in_file: .ascii "./dc_in\0" /* name of input file. You have to create it!!!! */
	out_file: .ascii "./dc_out\0"
