#Laboratory Exercise 5, Home Assigment 1
.data
	test:	.asciiz "Dinh Thi Thu Ha - 20194543 - Viet Nhat 02-K64"
.text
	li 	$v0,4
	la	$a0,test
	syscall

	