.eqv MONITOR_SCREEN 0x10010000
.eqv RED            0x00FF0000
.eqv GREEN          0x0000FF00
.data
mess1: .asciiz "Nhap vao toa do diem thu nhat:"
mess2: .asciiz "Nhap vao toa do diem thu hai:"
mess3: .asciiz "Nhap x: "
mess4: .asciiz "Nhap y: "
.text
	li $k0, MONITOR_SCREEN
	
	li $v0, 4
	la $a0, mess1
	syscall
	li $v0, 4
	la $a0, mess3
	syscall
	li $v0, 5
	syscall
	addi $s1, $v0, 0
	li $v0, 4
	la $a0, mess4
	syscall
	li $v0, 5
	syscall
	addi $s2, $v0, 0
	
	li $v0, 4
	la $a0, mess2
	syscall
	li $v0, 4
	la $a0, mess3
	syscall
	li $v0, 5
	syscall
	addi $s3, $v0, 0
	li $v0, 4
	la $a0, mess4
	syscall
	li $v0, 5
	syscall
	addi $s4, $v0, 0
	li $t6, 64
	addi $t5, $s2, 0
loop1: slt $t1, $s4, $t5
	 bne $t1, $0, end_loop1
	 mul $t2, $t5, $t6
	 add $t2, $k0, $t2
	 addi $t4, $s1, 0
loop2: slt $t1, $s3, $t4
	 bne $t1, $0, end_loop2
	 add $t3, $t4, $t4
	 add $t3, $t3, $t3
	 add $t3, $t2, $t3
	 beq $t5, $s2, if1
	 beq $t5, $s4, if1
	 beq $t4, $s1, if1
	 beq $t4, $s3, if1
	 li $t0, GREEN
	 sw  $t0, 0($t3)
	 addi $t4, $t4, 1
	 j loop2
end_loop2: addi $t5, $t5, 1
		j loop1
if1:li $t0, RED
	 sw  $t0, 0($t3)
	 addi $t4, $t4, 1
	 j loop2
end_loop1:
