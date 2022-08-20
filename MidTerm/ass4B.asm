.data
message_input_length:           .asciiz "Nhap vao kich thuoc mang: "
message_input_element:          .asciiz "Nhap danh sach cac phan tu (bam enter giua cac phan tu): \n"
message_solved:                	.asciiz "Phan tu am lon nhat la: "
message_pos:			.asciiz	"tai vi tri la: "
.text
input_length: 	li 	$v0, 4
		la 	$a0, message_input_length
		syscall
		li 	$v0, 5                    	#v0 chua so nhap vao
		syscall
		
		add 	$a1, $zero, $v0	           	#a1 chua kich thuoc cua mang
		blez	$a1, input_length

input_element: 	li 	$v0, 4				
		la 	$a0, message_input_element
		syscall
		addi	$s1,$0,0			#khoi tao bien chay i

loop: 	 	beq 	$s1, $a1, end_loop		#neu bien chay i bang so phan tu cua mang thi dung
		li 	$v0, 5                          #nhap phan tu mang
		syscall
		sge 	$t4, $v0, $zero		   	#v0 >= 0, t4 = 1, else t4 = 0
		bne 	$t4, $zero, next_ele	   	#t4 = 1, next_ele
		add 	$a3, $zero, $v0               	#khoi tao gia tri lon nhat

next_ele: 	sub 	$sp, $sp, 4                   	#tang kich thuoc cua ngan xep
		sw 	$v0, 0($sp)                    	#luu gia tri vua nhap vao A[i] vao ngan xep
		add 	$s1, $s1, 1			#bien chay cua vong lap tang len 1
		
		j 	loop
		nop
end_loop:
main: 
		sub	$a3, $a3, 1			#tru di 1 voi gia tri am cuoi cung trong mang
		jal 	maxNegative
		nop
		
		li 	$v0, 4
		la 	$a0, message_solved
		syscall
		
		li 	$v0, 1
		add 	$a0, $zero, $a3               	#a3 chua so nguyen am lon nhat
		syscall
		
		li 	$v0, 4
		la 	$a0, message_pos
		syscall
		
		li 	$v0, 1
		add 	$a0, $zero, $s2               	#s2 chua vi tri cua phan tu am lon nhat
		syscall
end_main: 	li 	$v0, 10
		syscall
		
maxNegative:    li 	$s1, -1
		add 	$a1, $a1, -1
		addi	$s2, $0, 0
		
maxNeg_loop: 	beq 	$s1, $a1, end_maxNeg
		add 	$s1, $s1, 1	
		lw 	$t1, 0($sp)                 	#luu gia tri A[i] vao t1
		add 	$sp, $sp, 4                	#tro den phan tu A[i-1]
		sge 	$t2, $t1, $zero            	#neu t1 < 0
		bne 	$t2, $zero, maxNeg_loop
		sgt 	$t3, $t1, $a3             	#neu t1 > a3
		beq 	$t3, $zero, maxNeg_loop
		add 	$a3, $zero, $t1
		sub	$s2, $a1, $s1
		j 	maxNeg_loop
end_maxNeg: 	jr 	$ra


		
