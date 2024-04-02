.data
	msgA:   .asciiz "Nhap gia tri a: "
	msgB:   .asciiz "Nhap gia tri b: "
	msgC:   .asciiz "Nhap gia tri c: "
	msgD:   .asciiz "Nhap gia tri d: "
	msgX:   .asciiz "Nhap gia tri x: "
	result: .asciiz "Ket qua: "
	
.text
main:
	# Nhap a
    	li $v0, 4
    	la $a0, msgA
    	syscall
    	li $v0, 5
    	syscall
    	move $t1, $v0  
    	
    	# Nhap b
    	li $v0, 4
   	la $a0, msgB
   	syscall
    	li $v0, 5
    	syscall
    	move $t2, $v0 
    	
    	# Nhap c
    	li $v0, 4
    	la $a0, msgC
    	syscall
    	li $v0, 5
    	syscall
    	move $t3, $v0  

    	# Nhap d
    	li $v0, 4
    	la $a0, msgD
    	syscall
    	li $v0, 5
    	syscall
    	move $t4, $v0  

    	# Nhap x
    	li $v0, 4
    	la $a0, msgX
    	syscall
    	li $v0, 5
    	syscall
    	move $t5, $v0 
    	
    	
    	# t = a * x
    	mul $t6, $t1, $t5
    	
    	# t = t + b
    	add $t6, $t6, $t2
    	
    	# t = t * x
    	mul $t6, $t6, $t5
    	
    	# t = t - c
    	sub $t6, $t6, $t3
    	
    	# t = t * x
    	mul $t6, $t6, $t5
    	
    	# t = t - d
    	sub $t6, $t6, $t4
    	
    	move $s0, $t6
    	
    	li $v0, 4
    	la $a0, result
    	syscall
    	
    	li $v0, 1
    	move $a0, $s0
    	syscall
    	
    	li $v0, 10
    	syscall
