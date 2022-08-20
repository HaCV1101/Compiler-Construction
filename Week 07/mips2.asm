#Laboratory Exercise 7, Home Assignment 2
.text
main:	li	$a0,11		#thanh ghi $a0,$a1,$a2 luu cac so de test
	li	$a1,1
	li 	$a2,15	
	jal	max
	nop
	li	$v0,10		#ket thuc thuc hien
	syscall			
endmain:
max:	add	$v0,$a0,$0	#v0=a0, coi nhu a0 la so lon nhat
	sub	$t0,$a1,$v0	#t0=(a1)-(v0)
	bltz	$t0,okay	#neu (t0)<0 thi v0=(a0)
	nop
	add 	$v0,$a1,$0	#neu (t0)>=0 thi v0=(a1), coi nhu a1 la so lon nhat cho den hien tai
okay:	sub	$t0,$a2,$v0	#t0=(a2)-(v0)
	bltz	$t0,done	#neu (t0)<0 thi v0=(a0)
	nop
	add	$v0,$a2,$0	#neu (t0)>=0 thi v0=(a2)
done:	jr	$ra		#nhay den dia chi ben trong thanh ghi $ra




