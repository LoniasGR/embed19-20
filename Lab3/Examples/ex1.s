.text
.global main

main:
	mov r0, #1 /* first argument -> stdout*/
	ldr r1, =output_string /*second argument -> memory where output string is stored*/
	mov r2, #len /* third argument -> number of bytes of output message. len is a constant and thus its valus is moved to r2 */
			
	mov r7, #4 /* number of write system call */
	swi 0	

inp1:
	mov r0, #0 /* first argument -> stdin*/
	ldr r1, =inp_str /*second argument -> memory where input string will be stored*/
	mov r2, #8 /* third argument -> number of bytes to be read */
	mov r7, #3 /* number of read system call */
	swi 0
	cmp r0, #8 /* read returns how many bytes have been read, compare it with 8 */
	bne inp1 /* if it is not equal to 8, read again */

	mov r0, #1 /* first argument -> stdout*/
	ldr r1, =inp_str /*second argument -> memory where output string is stored*/
	mov r2, #8 /* third argument -> number of bytes of output message */
	mov r7, #4 /* number of write system call */
	swi 0
	
	mov r0, #0 /* first argument -> status = 0, everything ok*/
	mov r7, #1 /* number of exit system call */
	swi 0
	
.data
	output_string: .ascii "Please input a string 8 char long: " /* location of output string in memory */
len = . - output_string /* length of output_string is the current memory indicated by (.) minus the memory location of the first element of string. Len does not occupy memory. It is a constant for the assembler. */
	inp_str: .ascii "\0\0\0\0\0\0\0\0" /* pre-allocate 8 bytes for input string, initialize them with null character '/0'*/
