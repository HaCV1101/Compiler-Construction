#Laboratory Exercise 3, Assgiment 6
.data
n:		.word	10
arr:		.word	12,32,-45,-26,80,13,-74,-100,39,-204
step:		.word	1
.text
	#load
	lw	$s3, n
	la	$s2, arr
	lw	$s4, step
	#work
	addi	$s1, $0, 0			#i=0
	addi	$s6, $0, 0			#max_abs
loop:
	slt		$t2, $s1, $s3		#$t2 = i < n ? 1 : 0
	beq		$t2, $0, endloop	#if (i>=n) jump endloop
	add		$t1, $s1, $s1
	add		$t1, $t1, $t1
	add		$t1, $t1, $s2
	lw		$t0, 0($t1)		#arr[i]
if_1:
	bgtz	$t0,	endif_1			#if(arr[i]>0) jump endif_1
	sub		$t0, $0, $t0
endif_1:
if_2:
	slt	$t2, $t0, $s6			#$t2 = arr[i]<max_abs ? 1 : 0 
	bne	$t2, $0, endif_2		#if($t2!=0) jump endif _2: if(arr[i]<max_abs) jump endif_2
	add	$s6, $0, $t0			#max_abs=arr[i]
endif_2:
	add	$s1, $s1, $s4			#i=i+1
	j	loop
endloop:
