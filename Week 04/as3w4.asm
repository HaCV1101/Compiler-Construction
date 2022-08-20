#Laboratory Exercise 3
#a. abs  $s0,$s1$s0<= |$s1|
#b. move $s0,$s1$s0 <=$s1
#c. not  $s0, $s1$s0 <= bit invert ($s1)
#d. ble  $s1,$s2,label

.data
x:	.word	10
.text
	lw 	$s1, x		# load value x vao $s1
	nor 	$s0,$s1,$zero	# dao bit
exit:
