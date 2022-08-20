#Laboratory Exercise 3, Assignment 4, i<j
.data
x:	.word 10	#khoi tao gia tri cho x
y:	.word 20	#khoi tao gia tri cho y
z: 	.word 30	#khoi tao gia tri cho z
i:	.word 5		#khoi tao gia tri cho i
jj:	.word 8		#khoi tao gia tri cho jj

.text
	la $v0,i	# gan dia chi cua i vao thanh ghi $v0
	lw $s1,0($v0) 	# gan gia tri cua i vao thanh ghi $s1
	la $v1,jj	# gan dia chi cua j vao thanh ghi $v1
	lw $s2,0($v1)	# gan gia tri cua j vao thanh ghi $s2
	la $s4,x	# gan dia chi cua x vao thanh ghi $s4
	lw $t1,0($s4)	# gan gia tri cua x vao thanh ghi $t1
	la $s5,y	# gan dia chi cua y vao thanh ghi $s5
	lw $t2,0($s5)	# gan gia tri cua y vao thanh ghi $t2
	la $s6,z	# gan dia chi cua z vao thanh ghi $s6
	lw $t3,0($s6)	# gan gia tri cua z vao thanh ghi $t3
	
start:
	slt	$t0,$s1,$s2		#i<j thì $t0=1
	beq	$t0,$zero,else		#branch to else if i<j
	addi 	$t1,$t1,1		#then part: x=x+1
	addi 	$t3,$zero,1		#z=1
	j	endif			#skip "else" part
else:   addi  	$t2,$t2,-1		#begin else part: y=y-1
	add  	$t3,$t3,$t3		#z=2*z
endif:
