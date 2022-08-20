.eqv MONITOR_SCREEN 0x10010000
.eqv RED            0x00FF0000
.eqv GREEN          0x0000FF00
.eqv BLUE           0x000000FF
.eqv WHITE          0x00FFFFFF
.eqv YELLOW         0x00FFFF00
.text
	li $k0, MONITOR_SCREEN
	li $t7, 2
	li $t6, 64
	li $t1, 0 # TOA DO Y
	li $t3, 8
loop1: slt $t2, $t1, $t3 
	  beq $t2, $zero, end_loop1
	  mul $s1, $t1, $t6
	  add $s0, $k0, $s1 # LAY TOA DO X CUA MOI DONG
	  li $t4, 0 #TOA DO X
loop2: slt $t2, $t4, $t3
	  beq $t2, $0, end_loop2
	  add $t2, $t4, $t4
	  add $t2, $t2, $t2
	  add $t5, $s0, $t2
	  div $t1, $t7 
	  mfhi $s5
	  div $t4, $t7
	  mfhi $s6
	  add $s7, $s5, $s6 
	  div $s7, $t7
	  mfhi $s7
	  beq $s7, $0, next # NEU TONG HAI TOA DO CHIA HET CHO 2, IN RA MAU DO, NGUOC LAI IN RA MAU TRANG
	  li $t0, WHITE
	  sw  $t0, 0($t5)
	  j next2
next:  li $t0, RED
	  sw  $t0, 0($t5)
next2:  addi $t4, $t4, 1 # TANG TOA DO X
	  j loop2
end_loop2: addi $t1, $t1, 1 # TANG TOA DO Y
		 j loop1
end_loop1: