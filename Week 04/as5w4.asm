#Laboratory Exercise 5
.data
x:	.word	12	#x=12
y: 	.word	4	#y=4
i:	.word	0	# bien chay i=0
sum:	.word 	0	# tich sum=0
.text
	lw 	$s0,x	# load value x
	lw 	$s1,y	# load value y
	lw 	$s2,i	# load value i
	la 	$s3,sum	# load address sum
	li 	$s4,1	# load 1 to $s4
loop:
	beq 	$s1,$s4,endloop	# if y=1 then endloop
	srl 	$s1,$s1,1	# y=y:2
	addi 	$s2,$s2,1	# i=i+1
	j 	loop
endloop:
	sllv 	$s5,$s0,$s2	# sum=x*y
	sw	$s5,0($s3) 	# return sum
	