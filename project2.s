.data		#Data declaration section
my_string:	.space 3000
too_long:	.asciiz "Input is too long."
invalid_spaces:	.asciiz "Invalid base-36 number."
empty_string_error: .asciiz "Input is empty."

.text		#Assembly language instruction
.globl main

main:
	li $v0, 8
	la $a0, my_string
	syscall

	la $t0, my_string	#loaded the address of the string
	li $t2, 0 	#initialized i= 0
	li $t3, 32 	#loaded space here
	li $s0, 0	#initialized previous character to 0
	li $t5, 0	#initialized num_of_chracters
	li $t6, 0x0A	#loaded new line here
	li $t7, 0	#number of spaces in front( used for during calculation)

loop:
	lb $t1, 0($t0)		#got a character of the string

	beq $t1, $t3, dont_print_invalid_spaces		#if the character is not a space and
	bne $s0, $t3, dont_print_invalid_spaces		#if the previous character is a space and
	beq $t5, $0, dont_print_invalid_spaces		#if the num of previously seen characters is not zero and
	beq $t1, $0, dont_print_invalid_spaces		#if the chLaracter is not null and 
	beq $t1, $t6, dont_print_invalid_spaces		#if the character is not new line then print invalid 	
	li $v0, 4
	la $a0, invalid_spaces
	syscall		#print invalid spaces
	jr $ra	

dont_print_invalid_spaces:

	beq $t1, $t3, dont_incr_num_of_characters	#if character is not equal to a space, increment num_of_characters
	addi $t5, $t5, 1
dont_incr_num_of_characters:

	bne $t1, $t3, dont_count_space		#if current character is a space and
	bne $t5, $0, dont_count_space		#if num of previous character is equal to 0 then count space
	addi $t7, $t7, 1
dont_count_space:




	jr $ra
