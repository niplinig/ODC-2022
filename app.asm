# "Call-Box program" in MIPS assembly
	.data
		start:	.asciiz "Welcome to the Call-Box\n"
		input:	.asciiz "Enter your cents (two decimal): "
		continue:	.asciiz "Continue entering cents? (yes 1/ no 0): "
		errMsg:	.asciiz "Incorrect value. Choose from 0.05, 0.10, 0.25, 0.50, 100.00\n"
		output:	.asciiz "\nYour total is: " 
		zerof: .float 0.00
		money: .float 0.00
		cent05: .float 0.05
		cent10: .float 0.1
		cent25: .float 0.25
		cent50: .float 0.5
		cent100: .float 100
	.text
	.globl	main
	
main:
	# Print string start
	li	$v0,4
	la	$a0, start
	syscall
	
	# Declare cents values
	lwc1 $f2, zerof
	lwc1 $f3, money
	lwc1 $f4, cent05
	lwc1 $f5, cent10
	lwc1 $f6, cent25
	lwc1 $f7, cent50
	lwc1 $f8, cent100
	
centsInput:
	# Print string input
	li	$v0,4
	la	$a0, input
	syscall
	
	# Get input from the user
	li $v0,6
	syscall

centVal1:
	c.eq.s $f0, $f4
	bc1t centSum
	bc1f centErr
	
centVal2:
	c.eq.s $f0, $f5
	bc1t centSum
	bc1f centErr

centVal3:
	c.eq.s $f0, $f6
	bc1t centSum
	bc1f centErr

centVal4:
	c.eq.s $f0, $f7
	bc1t centSum
	bc1f centErr

centVal5:
	c.eq.s $f0, $f8
	bc1f centErr
	
centSum:
	# Sum the values
	add.s $f3, $f3, $f0
	
centContinue:
	# Print string continue
	li	$v0,4
	la	$a0, continue
	syscall
	
	# Get user confirmation as int
	li $v0,5
	syscall
	bne $v0, $zero, centsInput
	j centEnd
	
centErr:
	# Print string errMsg
	li	$v0,4
	la	$a0, errMsg
	syscall
	j centsInput
	
centEnd:	
	# Print string output
	li	$v0,4
	la	$a0, output
	syscall
	
	# Print money in float
	mov.s $f12, $f3
	li $v0,2
	syscall	
	
exit:
	# Exit the program
	li	$v0,10
	syscall

