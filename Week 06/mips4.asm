# Sap xep noi bot(tang dan) 
.data
A: 	.word 	7,-2,5,1,5,6,7,3,6,8,8,59,5	#khai bao mang A
    
.text
main: 
    	la 	$a0, A 				#$a0 = Address(A[0])
    	li 	$a1, 13				#length of array A: n
   	j 	sort 				#sort  
after_sort: 
    	li 	$v0, 10 			#exit
    	syscall
end_main:

sort: 
	li 	$t0, 0				#bien chay i cua vong lap 1
loop_1:
	li  	$t1, 0				#bien chay j cua vong lap 2
	addi 	$t0, $t0, 1			#i=i+1
	sub 	$t2, $a1, $t0			#n-i
loop_2:
	add 	$t3, $t1, $t1 			#put 2j in $t1
	add 	$t4, $t3, $t3 			#put 4j in $t2
	add 	$t4, $t4, $a0			#cong dia chi cua phan tu a0 voi 4j
	lw  	$a2, 0($t4)			#load A[j]
	lw  	$a3, 4($t4)			#load A[j+1]
if:
	slt 	$t7, $a2, $a3 			#if A[j] < A[j+1]
	bne 	$t7, $zero, end_if
	
# Swap: dao cho $a2,$a3 luu vao thanh ghi $t4
   	sw 	$a3, 0($t4) 			
    	sw 	$a2, 4($t4) 
end_if:
	add 	$t1, $t1, 1			#j=j+1
	
	slt 	$s1, $t1, $t2			#neu t1 < t2 -> $s1=1; else = 0
	beq 	$s1, $zero, endloop_2		#neu $s2=0 -> nhay den endloop_2
	j   	loop_2				#nhay den loop_2
endloop_2:
	slt 	$s2, $t0, $a1  			#neu $t0<$a1 thi $s2 =1,else =0
	beq 	$s2, $zero, endloop_1		#neu $s2=0 -> nhay den enloop_1
	j   	loop_1				#neu $s2=1 -> nhay den loop_1
endloop_1:

