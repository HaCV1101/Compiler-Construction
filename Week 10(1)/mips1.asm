.eqv	SEVENSEG_LEFT	0xFFFF0011	#Dia chi cua den led 7 doan trai.
					#	Bit 0 = doan a;
					#	Bit 1 = doan b;
					#	Bit 7 = dau .
.eqv 	SEVENSEG_RIGHT	0xFFFF0010	#Dia chi cua den led 7 doan phai
.data
n0: .byte 63	#so 0
n1: .byte 6	#so 1
n2: .byte 91	#so 2
n3: .byte 79	#so 3
n4: .byte 102	#so 4
n5: .byte 109	#so 5
n6: .byte 125	#so 6
n7: .byte 7	#so 7
n8: .byte 127	#so 8
n9: .byte 111	#so 9

.text	

main:
	lb	$a0, n4			#set value for segments
	jal	SHOW_7SEG_LEFT		#show
	lb	$a0, n3			#set value for segments
	jal 	SHOW_7SEG_RIGHT		#show
exit:	li	$v0, 10
	syscall
endmain:
#---------------------------------------------------------------
# Function  SHOW_7SEG_LEFT : turn on/off the 7seg
# param[in]  $a0   value to shown       
# remark     $t0 changed
#---------------------------------------------------------------
SHOW_7SEG_LEFT:	li	$t0,SEVENSEG_LEFT	#assign port's address
		sb	$a0, 0($t0)		#assign new value
		jr	$ra
	
#---------------------------------------------------------------
# Function  SHOW_7SEG_RIGHT : turn on/off the 7seg
# param[in]  $a0   value to shown       
# remark     $t0 changed
#---------------------------------------------------------------
SHOW_7SEG_RIGHT: 	li   $t0,  SEVENSEG_RIGHT	# assign port's address
			sb   $a0,  0($t0)	# assign new value
			jr   $ra   
			
			
			