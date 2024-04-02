#Chuong trinh 2_3_2: Call range function
#-------------------------------------------------------------------#
#Data segment 
.data
	arr: .word 10, 40, 2, 50, 12, 7, 80, 9, 99, 38
	arr_size: .word 10
	string_result: .asciiz "Gia tri cua ham range la: "
#-------------------------------------------------------------------#
#Code segment 
.text
.globl main
#-------------------------------------------------------------------#
#Chuong trinh chinh 
#-------------------------------------------------------------------#
main:
	la $a0, string_result
    	li $v0, 4
    	syscall
    	
	la $a0, arr
	lw $a1, arr_size
	
	jal range
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	#ket thuc chuong trinh (syscall) 	
end:
	li $v0, 10
	syscall

#-------------------------------------------------------------------#
#Range Function
#-------------------------------------------------------------------#
range:
    # Store registers on the stack
    addi $sp, $sp, -12          # Adjust stack pointer to save space for three registers
    sw $ra, 8($sp)              # Save return address
    sw $s2, 4($sp)              # Save $s2 if used by calling function
    sw $s3, 0($sp)              # Save $s3 if used by calling function
    
    # Initialize $s0 and $s1 with the base address of the array and the size
    move $s0, $a0               # Move base address of array into $s0
    move $s1, $a1               # Move size of the array into $s1
    
    # Call max function
    jal max                     # Call max
    move $s2, $v0               # Move max value to $s2

    # Reset array address and size for min function call
    move $a0, $s0               # Reset base address of array to $a0 from $s0
    move $a1, $s1               # Reset size of the array to $a1 from $s1

    # Call min function
    jal min                     # Call min
    move $s3, $v0               # Move min value to $s3
    
    # Calculate range
    sub $v0, $s2, $s3           # Subtract min ($s3) from max ($s2) to find range

    # Restore registers from the stack and return
    lw $s3, 0($sp)              # Restore $s3
    lw $s2, 4($sp)              # Restore $s2
    lw $ra, 8($sp)              # Restore $ra
    addi $sp, $sp, 12           # Adjust stack pointer back to original position
    jr $ra                      # Return from function
#-------------------------------------------------------------------#
#Range Function
#-------------------------------------------------------------------#
 
#-------------------------------------------------------------------#
#Max Function
#-------------------------------------------------------------------#
max:
    lw $v0, 0($a0)          # Load the first value of the array into $v0
    addi $a0, $a0, 4        # Increment the array pointer
    addi $a1, $a1, -1       # Decrement the size

max_loop:
    blez $a1, max_exit      # If no more elements, exit loop
    lw $t1, 0($a0)          # Load the next array value into $t1
    bgt $t1, $v0, max_found # If $t1 > $v0, new max found
    addi $a0, $a0, 4        # Increment the array pointer
    addi $a1, $a1, -1       # Decrement the size
    j max_loop              # Repeat loop

max_found:
    move $v0, $t1           # Move new max into $v0
    j max_loop              # Continue the loop

max_exit:
    jr $ra                  # Return from function
#-------------------------------------------------------------------#
#Max Function
#-------------------------------------------------------------------#

#-------------------------------------------------------------------#
#Min Function
#-------------------------------------------------------------------#
min:
    lw $v0, 0($a0)          # Load the first value of the array into $v0
    addi $a0, $a0, 4        # Increment the array pointer
    addi $a1, $a1, -1       # Decrement the size

min_loop:
    blez $a1, min_exit      # If no more elements, exit loop
    lw $t1, 0($a0)          # Load the next array value into $t1
    blt $t1, $v0, min_found # If $t1 < $v0, new min found
    addi $a0, $a0, 4        # Increment the array pointer
    addi $a1, $a1, -1       # Decrement the size
    j min_loop              # Repeat loop

min_found:
    move $v0, $t1           # Move new min into $v0
    j min_loop              # Continue the loop

min_exit:
    jr $ra                  # Return from function
#-------------------------------------------------------------------#
#Min Function
#-------------------------------------------------------------------#




