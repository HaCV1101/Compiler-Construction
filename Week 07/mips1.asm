#Laboratory Exercise 7 Home Assignment 1
.text
main: 	li	$a0, -45	#load tham so dau vao
	jal	abs		#nhay den chuong trinh con abs va luu dia chi tra ve trong thanh ghi $ra
	nop	
	add	$s0,$0,$v0
	li	$v0, 10 
	syscall
endmain:
abs:	sub	$v0,$0,$a0	#v0=-(a0) voi (a0)<0

	bltz	$a0,done	# neu (a0)<0 thi nhay den done
	nop
	add	$v0,$a0,$0	# neu (a0)>=0 thi  v0=(a0)
done: 	jr	$ra






