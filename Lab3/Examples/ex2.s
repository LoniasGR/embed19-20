.text
.global main

main:
	mov r0, #1 /* write system call */
	ldr r1, =string
	mov r2, #len
	mov r7, #4
	swi 0	

inp1:
	mov r0, #0 /* read system call */
	ldr r1, =inp_str
	mov r2, #8
	mov r7, #3
	swi 0
	cmp r0, #8
	bne inp1

	mov r0, #1 /* write system call */
	ldr r1, =string2
	mov r2, #len2
	mov r7, #4
	swi 0

inp2:
	mov r0, #0 /* read system call */
	ldr r1, =passphrase 
	mov r2, #8
	mov r7, #3
	swi 0
	cmp r0, #8
	bne inp2

	mov r0, #8 /* loop index */
	ldr r1, =inp_str /* load memory of string to be encoded in r1 */
	sub r1, r1, #1 /* subtract one from r1 for the loop to function correctly at first iteration*/
	ldr r2, =passphrase /* load memory of passphrase in r2 */
	add r2, r2, #8 /* add 8 to r1 for the loop to function correctly at first iteration*/

loop:
	ldrb r3, [r1, #1]! /* load in r3 one byte from memory. The memory address is indicated by r1 plus one byte. Update the value of r1 */ 	
	ldrb r4, [r2, #-1]! /* load in r4 one byte from memory. The memory address is indicated by r2 minus one byte. Update the value of r2 */
	sub r3, r3, r4 /* subtract r4 from r3 */
	strb r3, [r1] /* store the updated value of input phrase */	 
	subs r0, r0, #1 /* subtract one from index and update the flags */
	bne loop
	
	mov r0, #1 /* write system call */
	ldr r1, =inp_str
	mov r2, #8
	mov r7, #4 /*write*/
	swi 0

	mov r0, #0 /* exit system call */
	mov r7, #1
	swi 0

.data
	string: .ascii "Please input a string 8 char long: "
len = . - string
	string2: .ascii "Please input an 8-string long passphrase : "
len2 = . - string2
	inp_str: .ascii "\0\0\0\0\0\0\0\0"
	passphrase: .ascii "\0\0\0\0\0\0\0\0"
