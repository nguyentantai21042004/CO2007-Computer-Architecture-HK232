.data
	msg: .asciiz "Kien Truc May Tinh 2022"
	
.text
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 10
	syscall
