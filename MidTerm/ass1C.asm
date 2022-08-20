.data

String:		.space 40
result: 	.space 40

space: 		.asciiz " "
nhapXau:	.asciiz "Nhap vao xau (do dai max 40) : "
res: 		.asciiz "Tu ngan nhat trong xau la:  "

.text

main:
	jal 	input
	nop
	jal 	process
	nop
	j 	printResult
	nop

input:
	li 	$v0, 54			 
	la 	$a0, nhapXau		
	la 	$a1, String		# a1 luu String nhap vao
	li 	$a2, 40			# do dai max cua String
	syscall

### in ra xau vua nhap
	li 	$v0, 4
	la 	$a0, String
	syscall
	jr 	$ra

process:
	addi 	$fp, $sp, 0		# luu sp ban dau
	la 	$s0, String		# dia chi cua xau String
	addi 	$t0, $s0, 0		# t0 tro den dia chi String[0]
	addi 	$t1, $zero, 0		# do dai dang xet
	addi 	$s1, $zero, 0		# do dai min

loop:
	lb 	$t2, 0($t0)		# t2 = String[i] 
	li 	$t7, 0			# t7 = 0, danh dau thoat lap
	beq 	$t2, '\0', check	# s[i] = "\0", check lan cuoi va thoat lap
	li 	$t7, 1			# t7 = 1, tiep tuc vong lap
	beq 	$t2, ' ', check		# gap dau cach " ", duyet xong 1 tu, check
	beq 	$t2, '\n', continue	# gap '\n' thi skip 

checkWord:
	addi 	$t1, $t1, 1		# do dai dang xet + 1
	sb	$t2, 0($sp)		# luu ky tu String[i] vao stack
	addi 	$sp, $sp, -1		# sp = sp - 1, them 1 byte vao ngan nho stack
	j 	continue

check:
	beqz 	$s1, update		# s1 chua co gia tri, cap nhat vao result xau vua xet
	beqz 	$t1, reset		# truong hop cac dau cach lien nhau
	blt 	$t1, $s1, update	# t1 < s1, update
	j 	reset			# t1 >= s1, reset va chay tiep vong lap

update:
	addi 	$t4, $sp, 0		# luu dia chi stack hien tai
	addi 	$sp, $fp, 0		# lay dia chi duoi cung cua stack
	la 	$t3, result		# t3 chua dia chi xau result

getString:
	lb 	$t5, 0($sp)		# t5 = gia tri o stack
	sb 	$t5, 0($t3)		# result[i] = t5

	addi 	$sp, $sp, -1		# tro den gia tri stack ben tren
	addi 	$t3, $t3, 1		# tro den result[i+1]
	bne 	$t4, $sp, getString	# xet cac ky tu cua tu vua luu

	li 	$t8, '\0'		
	sb 	$t8, 0($t3)		# them '\0' vao cuoi result
	addi 	$s1, $t1, 0		# update gia tri cua do dai min

reset:
	addi 	$sp, $fp, 0		# tro ve dau stack
	addi 	$t1, $zero, 0

	li 	$v0, 1
	addi 	$a0, $s1, 0
	syscall

continue:

	addi 	$t0, $t0, 1		# tro den dia chi String[i+1]
	beqz 	$t7, endloop		# t7 = 0, thoat lap
	j 	loop

endloop:
	jr 	$ra

#############3 in ket qua tu ngan nhat tim duoc
printResult:
	li 	$v0, 59
	la 	$a0, res
	la 	$a1, result
	syscall

end:
