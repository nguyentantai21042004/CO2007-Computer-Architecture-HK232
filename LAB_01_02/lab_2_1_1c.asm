.data
	temp: .space 10
	msg: .asciiz "Nhap vao mot chuoi 10 ky tu: "
	newLine: .asciiz "\n"
	
.text
main:
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 8
	la $a0, temp
	li $a1, 10
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall 
	
	li $v0, 4
	la $a0, temp
	syscall
	
	li $v0, 10
	syscall
	
