.eqv KEY_CODE 	0xFFFF0004 # ASCII code from keyboard, 1 byte
.eqv KEY_READY 0xFFFF0000 # =1 if has a new keycode ?
# Auto clear after lw
.eqv DISPLAY_CODE 0xFFFF000C # ASCII code to show, 1 byte
.eqv DISPLAY_READY 0xFFFF0008 # =1 if the display has already to do
# Auto clear after sw
.eqv HEADING 0xffff8010 # Integer: An angle between 0 and 359
.eqv MOVING 0xffff8050 # Boolean: whether or not to move
.eqv LEAVETRACK 0xffff8020 # Boolean (0 or non-0):
# whether or not to leave a track
.eqv WHEREX 0xffff8030 # Integer: Current x-location of MarsBot
.eqv WHEREY 0xffff8040 # Integer: Current y-location of MarsBot
.data
.text
	li $k0, KEY_CODE
	li $k1, KEY_READY
	li $s0, DISPLAY_CODE
	li $s1, DISPLAY_READY
	
	addi $a0, $zero, 135		#Marsbot rotates 135* and start
	jal ROTATE
	jal TRACK			#Start draw
	jal GO
loop: nop
WaitForKey: lw $t1, 0($k1) # $t1 = [$k1] = KEY_READY
	beq $t1, $zero, WaitForKey # if $t1 == 0 then Polling
ReadKey: lw $t0, 0($k0) # $t0 = [$k0] = KEY_CODE
		addi	$v0, $0, 1
		addi	$a0, $t0, 0
		syscall
Control:
		jal UNTRACK		# keep old track
		li	$a0, MOVING
		lb	$a0, 0($a0)
SPACE:	bne 	$t0, ' ', UP
		bne	$a0, $0, stop
go:		jal	GO
		j	continue
stop:	jal	STOP
		j	continue
UP:		bne	$t0, 'w', DOWN
		addi $a0, $zero, 0
		j	rotate
DOWN:	bne	$t0, 's', LEFT
		addi $a0, $zero, 180
		j	rotate
LEFT:	bne	$t0, 'a', RIGHT
		addi $a0, $zero, 270
		j	rotate
RIGHT:	bne	$t0, 'd', continue
		addi $a0, $zero, 90
		j	rotate
rotate:				
		jal ROTATE
		jal TRACK			# and draw new track line
		j	continue
continue:	j loop
end_main:
	addi	$v0, $0, 10
	syscall
	
GO: 	li $at, MOVING # change MOVING port
		addi $a0, $zero,1 # to logic 1,
		sb $a0, 0($at) # to start running
		jr $ra
STOP: 	li $at, MOVING # change MOVING port to 0
		sb $zero, 0($at) # to stop
		jr $ra
TRACK: 	li $at, LEAVETRACK # change LEAVETRACK port
		addi $a0, $zero,1 # to logic 1,
		sb $a0, 0($at) # to start tracking
		jr $ra
UNTRACK:li $at, LEAVETRACK # change LEAVETRACK port to 0
		sb $zero, 0($at) # to stop drawing tail
		jr $ra
ROTATE: li $at, HEADING # change HEADING port
		sw $a0, 0($at) # to rotate robot
		jr $ra
