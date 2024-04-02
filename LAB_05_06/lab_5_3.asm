#Chuong trinh 3_3: Min and Max of Real Number
#-------------------------------------------------------------------#
#Data segment 
.data
arr:    	.float 4.1, 2.3, 6.9, 8.4, 4.6, 1.3, 4.8, 5.9, 2.9, 3.5
        	.float 4.1, 6.3, 8.9222, 8.2, 0.6, 7.9, 4.3, 8.2, 7.9, 2.1
str1:	.asciiz "Phan tu lon nhat la: "
str2: 	.asciiz "Phan tu nho nhat la: "
newLine:	.asciiz "\n"
#-------------------------------------------------------------------#
#Code segment 
.text
.globl main
#-------------------------------------------------------------------#
#Chuong trinh chinh 
#-------------------------------------------------------------------#
main:
	la $a0, arr	# Load address of first element
	l.s $f12, 0($a0)	# Load first element of arr to f12 (f12 used for first single)
			# f14 for the second
	li $t1, 20		# Load size of arr to t1
	
	li $t0, 1		# t0 ~ i
	sll $t2, $t1, 2	# Calculate total byte for array
	add $a1, $a0, $t2	# Address of the end of arr

max_loop:
	l.s $f2, 0($a0)	# Load current element
	c.le.s $f12, $f2	# if f12 < f2, skip bc1f
	bc1f max_skip	
	mov.s $f12, $f2	# Update Max
max_skip:
	addiu $a0, $a0, 4	# Move to the next element
	bne $a0, $a1, max_loop # If a0 is no the last element, continue to loop
	
	# Here, we have max in f12
	la $a0, str1
	li $v0, 4
	syscall
	li $v0, 2
	syscall
	
	la $a0, newLine
	li $v0, 4
	syscall
	
	# Reset for the next loop
	la $a0, arr
	l.s $f12, 0($a0)
	li $t0, 1
min_loop:
	l.s $f2, 0($a0)
	c.lt.s $f2, $f12             # f2 < f12, skipp min_skip
    	bc1f min_skip               
    	mov.s $f12, $f2              # Update min
min_skip:
    	addiu $a0, $a0, 4            # Move to the next element in the array
    	bne $a0, $a1, min_loop       # If not at the end of the array, loop

	# Here, we have min in f12
    	la $a0, str2                
    	li $v0, 4                    
    	syscall                    
    	li $v0, 2                    
    	syscall      	
#-------------------------------------------------------------------#
#End Program
#-------------------------------------------------------------------#
	li $v0, 10
	syscall
