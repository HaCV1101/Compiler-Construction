#Laboratory Exercise 5, same Home Assignment 1
.data
	sum: 	.asciiz "The sum of "
	andW: 	.asciiz " and "		
	is:	.asciiz " is "
.text
	addi	$s0, $0, 1101
	addi	$s1, $0, 1509	
	add	$t0, $s0, $s1
	
	li	$v0, 4			# print string
	la	$a0, sum		# print "The sum of "
	syscall
	
	li	$v0, 1			# print number
	la	$a0, 0($s0)		# print s0
	syscall
	
	li	$v0, 4			# print string
	la	$a0, andW		# print " and "
	syscall
	
	li	$v0, 1			# print number
	la	$a0, 0($s1)		# print s1
	syscall
	
	li	$v0, 4			# print string
	la	$a0, is			# print " is "
	syscall
	
	li	$v0, 1			# print number
	la	$a0, 0($t0)		# print t0 = s0 + s1
	syscall
