.data		#Data declaration section
my_string:	.space 3000 
.text		#Assembly language instruction
.globl main

main:
	li $v0, 8
	la $a0, my_string
	syscall


	
	jr $ra
