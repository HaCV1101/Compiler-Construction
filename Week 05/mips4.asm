#Laboratory Exercise 5, Home Assignment 3
.data
	string:		.space	111			# destination string x, empty
	MessageDia1:	.asciiz	"Input String: "
	MessageDia2:	.asciiz	"String length: "
.text
main:
get_string:
	li 	$v0, 54
	la 	$a0, MessageDia1
	la 	$a1, string	
	la 	$a2, 128
	syscall
get_length:
	la  $a0, string			#$a0 = Address(string[0])
	add $v1, $0, $0			#$v1 = length = 0
	add $t0, $0, $0			#$t0 = i
check_char:
	add $t1, $a0, $t0		#$t1 = string[i]'s address
	lb  $t3, 0 ($t1)		#$t3 =  string[i]
	beq $t3, $zero, end_get_length
	nop
	addi $v1, $v1, 1		#$v1 = length ++
	addi $t0, $t0, 1		#$t0 = i ++
	j	check_char
	nop
end_get_length:
	li $v0, 56	
	la $a0, MessageDia2		#print the string
	addi $v1, $v1, -1
	la $a1, 0 ($v1)			#print the length of string
	syscall