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

	
	jr $ra
