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


	
	jr $ra
