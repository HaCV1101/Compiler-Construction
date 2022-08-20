.data
	string:		.space	50
	message:	.asciiz	"\nChuoi dao nguoc:\n"
.text
	addi	$t0, $0, 21
	la	$s0, string
read_char:	
	li	$v0, 12
	syscall

	addi	$t0, $t0, -1
	beq 	$v0, 10, end_read_char
	beqz	$t0, end_read_char
	
	add	$t1, $t0, $s0
	sb	$v0, 0 ($t1)
	
	j	read_char
end_read_char:
	li	$v0, 4			# read string $v0 luu charactor
	la 	$a0, message
	syscall
	li	$v0, 4
	la	$a0, 0 ($t1)		# in ra chuoi dao nguoc
	syscall
	
	


	
	
