#Chuong trinh 2_2_5: while - tim ky tu trong chuoi 
#----------------------------------- 
#Data segment
.data
	input: .asciiz "Computer Architecture CSE-HCMUT"
	result: .asciiz "Ky tu 'r' dau tien trong chuoi nam o vi tri: "
#----------------------------------- 
#Code segment 
.text 
.globl main 
#----------------------------------- 
#Chuong trinh chinh 
#----------------------------------- 
main:
	la $a1, input
	li $t0, 0		# i = 0
	
find_r:
	lb $t1, 0($a1)	
	beqz $t1, not_found	# *input == "\0"
	li $t2, 'r'
	beq $t1, $t2, found 	# *input == 'r'
    	addiu $a1, $a1, 1  	# *input += 1
    	addiu $t0, $t0, 1  	# i += 1
    	j find_r 

not_found:
	li $a0, -1
	li $v0, 1
	syscall
	
	j end
	
found:
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
#ket thuc chuong trinh (syscall) 
end:
	li $v0, 10
	syscall 
#----------------------------------- 
#Cac chuong trinh con khac 
#-----------------------------------
	
	
	
	 
