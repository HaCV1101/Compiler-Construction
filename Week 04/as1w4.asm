#Laboratory Exercise 4, Home Assignment 1
.data
x:		.word	0x7fffffff
y:		.word	1
isOverflow:	.word	0
.text
start:
	lw	$s1,x			#Load value x
	lw	$s2,y			#Load value y
	la	$s4,isOverflow		#Load address isOverflow
	li	$t0,0			#No Overflow is default status
	addu	$s3,$s1,$s2		# s3 = s1 + s2
	xor	$t1,$s1,$s2		#Test if $s1 and $s2 have same sign 
	
	bltz 	$t1,EXIT 		#If not, exit
	xor	$t2,$s2,$s3		#Test if $s2 and $s3 have same sign 
	bltz	$t2,OVERFLOW		#If not ,jump overflow
	j	EXIT
OVERFLOW:
	li	$t0,1			#The result is overflow
EXIT:
	sw 	$t0,0($s4)
