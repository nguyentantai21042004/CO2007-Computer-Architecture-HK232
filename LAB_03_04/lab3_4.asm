#Chuong trinh 2_2_4: Tinh Fibonacci dung vong lap
#Data segment
	.data
#Cac dinh nghia bien
arr_f:	.space 	80
int_n:	.word 	1
#Cac cau nhac nhap du lieu
inval:  .asciiz  "invalid input"
nhap_n:	.asciiz  "Nhap n: "
nhac_1: .asciiz  "Fibo("
nhac_2: .asciiz  ") = "
#Code segment
	.text
	.globl	main
#----------------------------------- 
#Chuong trinh chinh 
#----------------------------------- 
main:	
#Nhap (syscall)
  #Nhap n
	la	$a0,nhap_n
	li	$v0,4
	syscall
	li	$v0,5
	syscall
	sw	$v0,int_n
  #Xu ly
	lw	$s0,int_n
	bltz 	$s0,invalid	#n khong hop le
	addi	$t9,$s0,1 #t9=n+1
	la	$t0,arr_f
	li 	$t5,1
	sw	$zero,($t0)	#f[0] = 0
	beq	$s0,$zero,output #n = 0 thi in ra f[0]
	move	$t1,$t0	#t1 = addr(f[0])
	addi	$t0,$t0,4 
	sw	$t5,($t0)	#f[1] = 1
	move	$t2,$t0	#t2 = addr(f[1])
	beq	$s0,$t5,output #n = 1 thi in ra f[1]
	li	$t3,2 #t3 la bien i
loop:	
	addi	$t0,$t0,4
	lw	$t6,($t1)	#t6 = f[n-2], t1 = addr(f[n-2])
	lw	$t7,($t2)	#t7 la f[n-1], t2 = addr(f[n-1])
	add	$t8,$t6,$t7
	sw	$t8,($t0)	#luu f[i]
	addi	$t1,$t1,4
	addi	$t2,$t2,4
	addi 	$t3,$t3,1
	bne	$t3,$t9,loop	# cond = (i < n+1); i = n+1 thoat khoi loop
#endloop
#Xuat ket qua (syscall)
output:	la 	$a0,nhac_1 # Fibo(
 	li	$v0,4 
 	syscall 
 	move 	$a0,$s0 # Fibo(n
 	li	$v0,1 
 	syscall 	
 	la 	$a0,nhac_2 # Fibo(n) = 
 	li	$v0,4 
 	syscall 
	lw	$a0,($t0)  #Fibo(n) = f
	li 	$v0,1
	syscall
	j end
# n khong hop le
invalid:	la	$a0,inval
		li	$v0,4
		syscall   
 #ket thuc chuong trinh(syscall)
end:	li $v0,10
	syscall	
#--------------------------------------
