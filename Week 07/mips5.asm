#Laboratory Exercise 7, Assignment 5
.data
Mess1:	.asciiz "Largest: "
Mess2: 	.asciiz "\nSmallest:"
Comma:	.asciiz ","
.text
main: 	li 	$s0, 11            # Load input 
	li 	$s1, 1
	li 	$s2, 0
	li 	$s3, -9
	li 	$s4, 15
	li	$s5, 11
	li	$s6, 14
	li 	$s7, -20
	jal 	init 			
	nop
	li 	$v0, 4		
	la 	$a0, Mess1	 #print mess1
	syscall
	li 	$v0 , 1
	add 	$a0,$t0,$zero
	syscall          	#print max value
	li 	$v0, 4
	la 	$a0, Comma    	#print ","
	syscall 
	li 	$v0 , 1		
	add 	$a0,$t5,$zero   # print max value's position
	syscall	
	li 	$v0, 4
	la 	$a0, Mess2	#print mess2
	syscall
	li 	$v0 ,1
	add 	$a0,$t1,$zero
	syscall     		#print min value
	li 	$v0 ,4
	la 	$a0, Comma 	#print ","
	syscall		
	li 	$v0 , 1
	add 	$a0,$t6,$zero
	syscall       		# print min value's position
	li 	$v0, 10	
	syscall			# exit
endmain:
swapMax:	add 	$t0,$t3,$zero	# set Max = $t3
		add	$t5,$t2,$zero	# set i of max = $t2
		jr 	$ra
swapMin:	add 	$t1,$t3,$zero	# set Min = $t3
		add 	$t6,$t2,$zero	# set i of min = $t2
		jr 	$ra
init:		add 	$fp,$sp,$zero	# save address of origin sp
		addi 	$sp,$sp, -36	# create space for stack
		sw	$s0, 0($sp)
		sw 	$s1, 4($sp)
		sw 	$s2, 8($sp)
		sw 	$s3, 12($sp)
		sw 	$s4, 16($sp)
		sw 	$s5, 20($sp)
		sw 	$s6, 24($sp)
		sw 	$s7, 28($sp)
		sw 	$ra, 32($sp)	#save $ra for main
		add 	$t0,$s0,$zero	# set Max = $s0
		add 	$t1,$s0,$zero	# set Min = $s0
		li 	$t5, 0		# set $t5 to 0
		li 	$t6, 0		# set $t6 to 0
		li 	$t2, 0		# set $t2 to 0 , i = 0 
max_min:	addi 	$sp,$sp,4
		lw 	$t3,-4($sp)
		sub 	$t4, $sp, $fp	# check if meet $ra
		beq 	$t4,$zero, done	# if true then done
		addi 	$t2,$t2,1	# i++
		sub 	$t4,$t0,$t3	# Max - $t3
		bltzal 	$t4, swapMax	#if Max - $t3 < 0, swap Max
		sub 	$t4,$t3,$t1	# $t3 - Min
		bltzal 	$t4, swapMin	# if $t3 â€“ Min < 0 , swap Min
		j 	max_min		# repeat
done: 		lw 	$ra, -4($sp)	# load #$ra
		jr 	$ra 		# return
		
		