.data

nhapA: 	.asciiz "Nhap a:"
nhapB: 	.asciiz "Nhap b:"
nhapC: 	.asciiz "Nhap c:"

TG: 	.asciiz "a,b,c la 3 canh cua tam giac"
notTG: 	.asciiz "a,b,c khong la 3 canh cua tam giac"

notTG1: .asciiz "a khong la canh cua tam giac"
notTG2: .asciiz "b khong la canh cua tam giac"
notTG3: .asciiz "c khong la canh cua tam giac"

.text
#### nhap a tu ban phim
loop1:	li 	$v0, 51
	la	$a0, nhapA
	syscall

#### luu a vao s0
	addi 	$s0, $a0, 0
	slt	$k0, $0, $s0
	beq	$k0, $0, notT_g1
	nop
	
	  
#### nhap b tu ban phim
loop2:	li 	$v0, 51
	la 	$a0, nhapB
	syscall

#### luu b vao s1
	addi 	$s1, $a0, 0
	slt	$k0, $0, $s1
	beq	$k0, $0, notT_g2
	nop

#### nhap c tu ban phim
loop3:	li 	$v0, 51
	la 	$a0, nhapC
	syscall

#### luu c vao s2
	addi 	$s2, $a0, 0
	slt	$k0, $0, $s2
	beq	$k0, $0, notT_g3
	nop
	j 	check1
	nop
	
notT_g1:
	li 	$v0, 55
	la 	$a0, notTG1
	syscall
	j 	loop1
	nop
	
notT_g2:
	li 	$v0, 55
	la 	$a0, notTG2
	syscall
	j 	loop2
	nop
	
notT_g3:
	li 	$v0, 55
	la 	$a0, notTG3
	syscall
	j 	loop3
	nop
	
check1:
	add 	$t0, $s0, $s1		# t0 = s0 + s1 = a + b
	bgt 	$t0, $s2, check2	# neu (a+b) > c, check tiep
	j 	notT_g			# nguoc lai a,b,c khong phai 3 canh
	nop
check2:
	add 	$t0, $s0, $s2		# t0 = s0 + s2 = a + c
	bgt 	$t0, $s1, check3	# neu (a+c) > b, check tiep
	j 	notT_g			# nguoc lai a,b,c khong phai 3 canh
	nop
check3:
	add 	$t0, $s1, $s2		# t0 = s1 + s2 = b + c
	bgt 	$t0, $s0, Tg		# neu (b+c) > a ==> 3 canh tam giac
	j 	notT_g			# nguoc lai a,b,c khong phai 3 canh
	nop
Tg:	### in ra ket qua la tam giac
	li 	$v0, 55
	la 	$a0, TG
	syscall
	j 	end
	nop
notT_g:	### in ra ket qua khong la tam giac
	li 	$v0, 55
	la 	$a0, notTG
	syscall
	j 	end
	nop
end:
