#Chuong trinh 22.2: if (a>=-3 && a<=4) 
#----------------------------------- 
#Data segment 
.data
	input_a: .asciiz "Hay nhap gia tri a: "
	input_b: .asciiz "Hay nhap gia tri b: "
	input_c: .asciiz "Hay nhap gia tri c: "

	result: .asciiz "Gia tri cua a la: "
#----------------------------------- 
#Code segment 
.globl main 
.text
#----------------------------------- 
#Chuong trinh chinh 
#----------------------------------- 
main:
	# Read a
	la $a0, input_a
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Read b
	la $a0, input_b
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Read c
	la $a0, input_c
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	# a < -3
	li $t3, -3
	bge $t0, $t3, check_greater_than_or_equal_7
	j calculate_multiply
	
check_greater_than_or_equal_7:
	li $t3, 7
	ble $t0, $t3 calculate_addition
	
calculate_multiply:
	mul $t0, $t1, $t2
	j end
	
calculate_addition:
	add $t0, $t1, $t2

#ket thuc chuong trinh (syscall) 
end:
	#Xuat ket qua (syscall) 	
	la $a0, result
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
#----------------------------------- 
#Cac chuong trinh con khac 
#-----------------------------------
