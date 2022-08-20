.eqv KEY_CODE 	0xFFFF0004 			# ASCII code from keyboard, 1 byte
.eqv KEY_READY 0xFFFF0000 			# =1 if has a new keycode ?
# Auto clear after lw
.eqv DISPLAY_CODE 0xFFFF000C 			# ASCII code to show, 1 byte
.eqv DISPLAY_READY 0xFFFF0008			# =1 if the display has already to do
# Auto clear after sw
.data
exit:		.asciiz	"exit"
.text
		li	$k0, KEY_CODE
		li 	$k1, KEY_READY
		li 	$s0, DISPLAY_CODE
		li 	$s1, DISPLAY_READY
		la 	$s2, exit
		addi	$t3, $0, 0
loop: 		nop
WaitForKey: 	lw $t1, 0($k1) 			# $t1 = [$k1] = KEY_READY
		beq $t1, $zero, WaitForKey 	# if $t1 == 0 then Polling
ReadKey: 	lw $t0, 0($k0) 			# $t0 = [$k0] = KEY_CODE
WaitForDis: 	lw $t2, 0($s1) 			# $t2 = [$s1] = DISPLAY_READY
		beq $t2, $zero, WaitForDis 	# if $t2 == 0 then Polling
Encrypt:  	# change input key
checkNum:	bgt	$t0, 57, checkUpperChar
		blt	$t0, 48, checkUpperChar
		j	ShowKey
checkUpperChar:	bgt	$t0, 90, checkLowerChar
		blt	$t0, 65, checkLowerChar
		addi	$t0, $t0, 32
		j	ShowKey
checkLowerChar:	bgt	$t0, 122, Simbol
		blt	$t0, 97, Simbol
checkExit:	add	$t4, $t3, $s2
		lb	$t4, 0($t4)
		bne	$t4, $t0, reset
		addi	$t3, $t3, 1
		addi	$t0, $t0, -32
		j	ShowKey
reset:		addi	$t3, $0, 0
		beq	$t0, 'e', checkExit
		addi	$t0, $t0, -32
		j	ShowKey
Simbol:		addi	$t0, $0, 42
ShowKey: 	sw 	$t0, 0($s0) 		# show key
		nop
		beq	$t3, 4, end
continue:	j 	loop
end:
		addi	$v0, $0, 10
		syscall
