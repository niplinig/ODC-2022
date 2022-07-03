# "Call-Box program" in MIPS assembly
	.data
		colon: .asciiz ":"
		zero: .asciiz "0"
	
		start:	.asciiz "\nWelcome to the Call-Box\n"
		cntInput:	.asciiz "Enter your cents (0.05 = 5 cents): "
		cntCont:	.asciiz "Continue entering cents? (yes 1/ no 0): "
		cntErr:	.asciiz "Incorrect value, please try again.\nChoose from 0.05, 0.10, 0.25, 0.50, 1.00\n"
		cntErr2: .asciiz "You need to enter more than 40 cents\n"
		cntOutput:	.asciiz "\nYou entered $"

		zerof: .float 0.00
		money: .float 0.00
		cent05: .float 0.05
		cent10: .float 0.1
		cent25: .float 0.25
		cent50: .float 0.5
		cent100: .float 1

		phnInput: .asciiz "\n\nEnter your phone number (9 digits): "
		phnErr: .asciiz "\nWrong number, please try again"
		phnOutput: .asciiz "\nTotal amount $"
		phnCall: .asciiz "\nStarting call ...\n"
		phnCall2: .asciiz "Ringing ...\n"
		phnCall3: .asciiz "\nCall ended\n"
		
		phnMin: .word 99999999
		phnMax: .word 999999999
		cent40: .float 0.4
		cost: .float 0.00
		hundred: .float 100.0
		ten: .float 10.0
		
		phnDur: .asciiz "\n\nDuration time hh/mm/ss: "
		phnChan: .asciiz "\n\nYour change is $" 
		phnEnd: .asciiz "\n\nThanks for using our service\n"

	.text
	.globl	main
	
main:
	# Print string start
	li	$v0,4
	la	$a0, start
	syscall
	
	# Tambien se puede usar s.s pseudo instrucción para guardar valores decimales en memoria
	
	# Load cents values
	lwc1 $f2, zerof
	lwc1 $f3, money
	lwc1 $f4, cent05
	lwc1 $f5, cent10
	lwc1 $f6, cent25
	lwc1 $f7, cent50
	lwc1 $f8, cent100
	lwc1 $f9, cent40
	
	# Load phone values
	lwc1 $f10, cost
	lw $s1, phnMin
	lw $s2, phnMax
	lwc1 $f11, hundred 
	lwc1 $f13, ten
	
centsInput:
	# Print string input
	li	$v0,4
	la	$a0, cntInput
	syscall
	
	# Get input from the user
	li $v0,6
	syscall

centVal0:
	c.eq.s $f0, $f2
	bc1t centErr

centVal1:
	c.eq.s $f0, $f4
	bc1t centSum
	
centVal2:
	c.eq.s $f0, $f5
	bc1t centSum

centVal3:
	c.eq.s $f0, $f6
	bc1t centSum

centVal4:
	c.eq.s $f0, $f7
	bc1t centSum

centVal5:
	c.eq.s $f0, $f8
	bc1f centErr
	
centSum:
	# Sum the values
	add.s $f3, $f3, $f0
	c.le.s $f3, $f9
	bc1f centContinue
	
centErr2:
	li $v0, 4
	la $a0, cntErr2
	syscall
	j centsInput
	
centContinue:
	# Print string continue
	li	$v0,4
	la	$a0, cntCont
	syscall
	
	# Get user confirmation as int
	li $v0,5
	syscall
	bne $v0, $zero, centsInput
	j centEnd
	
centErr:
	# Print string errMsg
	li	$v0,4
	la	$a0, cntErr
	syscall
	j centsInput

centEnd:	
	# Print string output
	li	$v0,4
	la	$a0, cntOutput
	syscall
	
	# Print money in float
	mov.s $f12, $f3
	
	mul.s $f12, $f12, $f11 # multiphy by 100
	trunc.w.s $f12, $f12
	cvt.s.w $f12, $f12
	div.s $f12, $f12, $f11 # dividing by 100
	
	li $v0,2
	syscall	
	
phoneInput:
	# Print string phnInput
	li	$v0,4
	la	$a0, phnInput
	syscall
	
	# Get users phone number as integer
	li $v0,5
	syscall
	
phoneVal1:
	slt $t0, $s1, $v0
	beq $t0, $zero, phoneErr
	sle $t0, $v0, $s2
	beq $t0, $zero, phoneErr

phoneGetRandom:	
	li $v0, 43
	syscall
	# Número aleatorio va desde 0.0 hasta 1.0
	
	c.le.s $f0, $f9 # hacer que el número sea menor que 0.40
	bc1f phoneGetRandom
	
	c.lt.s $f0, $f5 # random < 0.10; si random es menor entonces está mal y tiene que volver a sacar un número aleatorio
	bc1t phoneGetRandom	
	
phoneCostRoundNumber:
	mul.s $f10, $f0, $f13 # multiphy by 100
	round.w.s $f10, $f10
	cvt.s.w $f10, $f10
	div.s $f10, $f10, $f13 # dividing by 100
	j phoneCall
	
phoneErr:
	# Print string phnErr
	li	$v0,4
	la	$a0, phnErr
	syscall
	j phoneInput	

phoneCall:
	# Print string phnCall
	li $v0, 4
	la $a0, phnCall
	syscall
	
	# Print string phnCall2
	li $v0, 4
	la $a0, phnCall2
	syscall
	
	li $v0, 32
	li $a0, 3000
	syscall
	
	li $v0, 4
	la $a0, phnCall3
	syscall
	
phonePrintCost:
	# Print string phnOutput
	li	$v0,4
	la	$a0, phnOutput
	syscall

	# Print cost in float
	mov.s $f12, $f10
	li $v0,2
	syscall
	
phoneCallEnd:
	# Print string phnDur
	li	$v0,4
	la	$a0, phnDur
	syscall
	
phoneHourPrint:	
	# Print hours
	li $a1, 24 # from 0 to 24 hours
	li $v0, 42
	syscall

	# Compare if less than 10 to print a 0 before
	move $t1, $a0
	slti $t0, $t1, 10
	beq $t0, $zero, hourRandomPrint
	
	# Print	string zero
	li $v0, 4
	la $a0, zero
	syscall
	
hourRandomPrint:	
	li $v0, 1
	move $a0, $t1 # $a0 random int (hour) to print
	syscall

	# Printing format colon
	li $v0, 4
	la $a0, colon
	syscall

phoneMinutePrint:		
	# Print minutes
	li $a1, 60
	li $v0, 42
	syscall

	# Compare if less than 10 to print a 0 before
	move $t1, $a0
	slti $t0, $t1, 10
	beq $t0, $zero, minRandomPrint
	
	# Print	string zero
	li $v0, 4
	la $a0, zero
	syscall
	
minRandomPrint:	
	li $v0, 1
	move $a0, $t1 # $a0 random int (hour) to print
	syscall

	# Printing format colon
	li $v0, 4
	la $a0, colon
	syscall

phoneSecondPrint:
	# Print seconds
	li $a1, 60
	li $v0, 42
	syscall

	# Compare if less than 10 to print a 0 before
	move $t1, $a0
	slti $t0, $t1, 10
	beq $t0, $zero, secRandomPrint
	
	# Print	string zero
	li $v0, 4
	la $a0, zero
	syscall
	
secRandomPrint:	
	li $v0, 1
	move $a0, $t1 # $a0 random int (hour) to print
	syscall
	
phoneChange: # Podría retornar al programa principal
	# Print string phnChan
	li	$v0,4
	la	$a0, phnChan
	syscall
	
	# Solo falta restar estos dos números
	sub.s $f12, $f3, $f10 # resta
	
	mul.s $f12, $f12, $f11 # multiphy by 100
	round.w.s $f12, $f12
	cvt.s.w $f12, $f12
	div.s $f12, $f12, $f11 # dividing by 100
	
	li $v0,2
	syscall

exit:

	# Print string phnEnd
	li $v0, 4
	la $a0, phnEnd
	syscall

	# Exit the program
	li	$v0,10
	syscall

