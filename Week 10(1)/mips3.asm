.eqv SEVENSEG_LEFT 0xFFFF0011 # Dia chi cua den led 7 doan trai.
.eqv SEVENSEG_RIGHT 0xFFFF0010 # Dia chi cua den led 7 doan phai
.data
num: .byte 63, 6,  91, 79, 102, 109 ,125, 7, 127, 111
message: .asciiz "Nhap vao mot ky tu: "
.text
main:
	addi	$v0, $0, 4
	la	$a0, message
	syscall
	addi	$v0, $0, 12
	syscall
	addi	$t0, $0, 100
	div	$v0, $t0
	mfhi	$v0			#lay so du cua so do khi chia cho 100
	addi	$t0, $0, 10
	div	$v0, $t0
	mflo	$v1			#lay so hang chuc
	mfhi	$v0			#lay so hang don vi
	la $a0, num
	add	$a0, $a0, $v1
	lb $a0, 0($a0) # set value for segments
	jal SHOW_7SEG_LEFT # show
	la $a0, num 
	add	$a0, $a0, $v0
	lb $a0, 0($a0) # set value for segments
	jal SHOW_7SEG_RIGHT # show
exit: li $v0, 10
	syscall
endmain:
SHOW_7SEG_LEFT: 
	li $t0, SEVENSEG_LEFT # assign port's address
	sb $a0, 0($t0) # assign new value
	jr $ra
SHOW_7SEG_RIGHT: li $t0, SEVENSEG_RIGHT # assign port's address
	sb $a0, 0($t0) # assign new value
	jr $ra
