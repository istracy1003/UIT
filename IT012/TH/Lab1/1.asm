.data 
array1:.word 5,6,7,8,1,2,3,9,10,4 
size1: .word 10 
array2:.byte 
1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 
size2: .word 16 
array3:.space 8 
size3: .word 8 
space: .asciiz " " 
newLine:.asciiz "\n" 
.text 
la $a1, array1 
 lw $a2, size1 
 li $t0, 0 
 jal PrintArray1 
 
 li $v0, 4 
 la $a0, newLine 
 syscall 
 
 la $a1, array2 
 lw $a2, size2 
 li $t0, 0 
 jal PrintArray2 
 j End 
PrintArray1: 
 blt $t0, $a2, LoopPrintArray1 
 jr $ra 
LoopPrintArray1: 
 li $v0, 1 
 lw $a0, 0($a1) 
 syscall
 li $v0, 4 
 la $a0, space 
 syscall 
 addi $a1, $a1, 4 
 addi $t0, $t0, 1 
 j PrintArray1 
PrintArray2: 
 blt $t0, $a2, LoopPrintArray2 
 jr $ra 
LoopPrintArray2: 
 li $v0, 1 
 lb $a0, 0($a1) 
 syscall 
 li $v0, 4 
 la $a0, space 
 syscall 
 addi $a1, $a1, 1 
 addi $t0, $t0, 1 
 j PrintArray2 
End: