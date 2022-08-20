#Laboratory Exercise 3, Assigment 2
.data
n:	.word 6				#khoi tao gia tri n=6
step:	.word 1				#khoi tao gia tri step =1
A:	.word 1,2,3,4,5,6 	#khoi tao mang A	
.text
	lw $s3,n		#gan gia tri n vao thanh ghi $s3
	la $s2, A		#gan mang A vao thanh ghi $s2
	lw $s4, step		#gan gia tri step vao thanh ghi $s4
	addi 	$s5,$zero,0	#sum=0
	addi 	$s1,$zero,0	#i=0
loop:	slt	$t2,$s1,$s3
	beq	$t2,$zero,endloop
	add 	$t1,$s1,$s1	#$t1=2*$s1
	add	$t1,$t1,$t1	#$t1=4*$s1
	add	$t1,$t1,$s2	#$t1 store the address of A[i]
	lw	$t0,0($t1)	#load value of A[i] in $t0
	add 	$s5,$s5,$t0	#sum=sum+A[i]
	add	$s1,$s1,$s4	#i=i+step
	j 	loop		#goto loop
endloop: