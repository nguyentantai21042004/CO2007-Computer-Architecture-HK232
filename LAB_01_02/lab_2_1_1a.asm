.data
	msg1: .asciiz "Nhap gia tri a: "
	msg2: .asciiz "Nhap gia tri b: "
	msg3: .asciiz "Nhap gia tri C: "
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
	sub $t3, $t0, $t1
	sub $t3, $t3, $t2
	
	move $a0, $t3
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall