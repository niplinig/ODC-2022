.data
.text
.globl main

main:
	li $a0, 4
	li $s0, 1

evaluacion:
        addi $sp, $sp, -4
        sw  $s0, 0($sp)
        # i = $t0
        #n = $a0
        # f = $s0        
        li $t2, 4
        
for:
		slt $t2, $t0, $a0
        beq $t2, $zero, exit 
        move $t3, $t0
        div $t3, $t4
        mfhi $t5
        
        slt $t6, $t1, $t5
        beq $t5, $zero, else
   		add, $s0, $s0, $t0
else:
		addi $t0, $t0, 1
		j for

exit:
        move $v0, $s0
        addi $sp, $sp, 4
        lw  $s0, 0($sp)
        jr $ra
      