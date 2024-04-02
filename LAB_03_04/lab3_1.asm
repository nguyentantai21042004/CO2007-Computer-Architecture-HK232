#Chuong trinh 22.1: if (a%2==0) 
#----------------------------------- 
#Data segment 
.data
	string1: .asciiz "Computer Science and Engineering, HCMUT\n"
	string2: .asciiz "Computer Architecture 2022\n"
	input: .asciiz "Nhap gia tri cua a: "
	
#----------------------------------- 
#Code segment
.text
.globl main
#----------------------------------- 
#Chuong trinh chinh 
#-----------------------------------
main:
	#Nhap a
	la $a0, input # loading the address of the string string1 into the $a0 register
	li $v0, 4
	syscall
	
	# Read input
	li $v0, 5
	syscall
	
	# Move a variable to register $a0
	move $a0, $v0
	
	#Xu ly 
	andi $t0, $a0, 1
	beq $t0, $zero, even
	
odd:
	la $a0, string2 # loading the address of the string string2 into the $a0 register
	li $v0, 4
	syscall
	
	j exit
	
even:
	la $a0, string1 # loading the address of the string string1 into the $a0 register
	li $v0, 4
	syscall

#ket thuc chuong trinh (syscall)	
exit:
	li $v0, 10
    	syscall
#----------------------------------- 
#Cac chuong trinh con khac 
#-----------------------------------
	
	
	
