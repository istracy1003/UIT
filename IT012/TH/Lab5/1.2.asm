.data 
array1:.word 5,6,7,8,1,2,3,9,10,4 
size1: .word 10 
array2:.byte 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 
size2: .word 16 
array3:.space 8 
size3: .word 8 
.text 
 	li $t0, 0 
 	lw $s2, size2 
 	lw $s4, size3 
 	j IfLoop 
IfLoop: 
 	blt $t0, $s4, Loop 
 	j End 
 Loop: 
 	la $s1, array2 
 	la $s3, array3 
 	add $s0, $s1, $t0 
 	lb $t9, 0($s0) 
 	subi $t8, $s2, 1 
 	sub $t8, $t8, $t0 
 	add $s0, $s1, $t8 
 	lb $t8, 0($s0) 
 	add $t9, $t8, $t9 
 	sll $t1, $t0, 2 
 	add $s3, $s3, $t1 
 	sw $t9, 0($s3) 
 	addi $t0, $t0, 1 
 	j IfLoop 
End: 
