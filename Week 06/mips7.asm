#Sap xep chen(giam dan)
.data
A: 	.word 	7,-2,5,1,5,6,7,3,6,8,8,59,5	#khai bao mang A
.text
main: 
	la 	$a0, A 			#$a0 = Address(A[0])
    	li 	$a1, 13			#do dai cua mang A la 13
   	j 	sort 			#sap xep 
after_sort: 
    	li 	$v0, 10 		#exit
    	syscall
end_main:
sort: 
	li 	$t0, 1			#bien chay i cua vong lap 1	
loop: 					#for i in range(1, len(arr))	
	add 	$t1, $t0, $t0 		#put 2i in $t0
	add 	$t2, $t1, $t1 		#put 4i in $t0
	add 	$t2, $t2, $a0		#cong dia chi cua a0 voi 4i
	lw  	$s1, 0($t2)		#load A[i]; key = a[i] 
	
	addi 	$t3, $t0, -1		#j=i-1
while:
	slt 	$t8, $t3, $zero 	#neu j<0 -> $t8=1
	bne 	$t8, $zero, end_while	#neu St8 =1 -> nhay den end_while
	
	add 	$t4, $t3, $t3 		#put 2i in $t3
	add 	$t5, $t4, $t4 		#put 4i in $t3
	add 	$t5, $t5, $a0		#cong dia chi cua a0 voi 4i
	lw  	$s2, 0($t5)		#arr[j]

	slt	$t9, $s2, $s1		#a[j]<key
	beq	$t9, $zero, end_while	#neu $t9=0->nhay den end_while
	
	# Swap; dao vi tri phan tu thu i+1 cho phan tu thu i cua mang
	lw	$s3, 4($t5)
   	sw	$s3, 0($t5) 		#A[j+1]=A[j] 
    	sw	$s2, 4($t5) 

    	addi	$t3,$t3,-1		#j=j-1
	j   while 
end_while:
	add $t3, $t3, 1			#j=j+1
	mul $s5, $t3, 4 		#$s5=j*4
	add $s6, $s5, $a0		#cong dia chi phan tu dau tien voi 4j
	sw  $s1, 0($s6)			#a[j+1]=key 

	add $t0, $t0, 1			#i=i+1
	slt $t6, $t0, $a1 		#neu i<n ->$t6=1,else $t6=0
	beq $t6, $zero, end_loop	#neu $t6=0->end_loop
	j   loop			#neu $t6=1->nhay den loop
end_loop:

