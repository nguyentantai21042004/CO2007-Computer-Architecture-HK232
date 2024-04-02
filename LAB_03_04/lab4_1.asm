#Chuong trinh 2_3_1: Call reverse function
#-------------------------------------------------------------------#
#Data segment 
.data
cArray: .asciiz "Computer Architecture 2022" # Initialize cArray
cArray_size: .word 26
#-------------------------------------------------------------------#
#Code segment
.text
.globl main
#-------------------------------------------------------------------#
#Chuong trinh chinh 
#-------------------------------------------------------------------#
main:
    la $a0, cArray
    lw $a1, cArray_size
    jal reverse # Call the function

    la $a0, cArray # Print the reversed string to the console
    li $v0, 4
    syscall
    j Exit
    jr $ra # Return from the main function
#-------------------------------------------------------------------#
#Reverse Function
#-------------------------------------------------------------------#
reverse:
    addi $sp, $sp, -8 # Save variables on the stack
    sw $ra, 4($sp)
    sw $a1, 0($sp)
    add $t1, $zero, $zero # Loop condition
    srl $t2, $a1, 1
loop:
    beq $t1, $t2, end_loop
    add $t3, $a0, $t1 # Calculate &cArray[i]
    lb $t4, 0($t3) # Load cArray[i] into $t4
    sub $t5, $a1, $t1 # Calculate cArray_size - i
    addi $t5, $t5, -1 # Adjust for correct array index
    add $t6, $a0, $t5 # Calculate &cArray[cArray_size - 1 - i]
    lb $t7, 0($t6) # Load cArray[cArray_size - 1 - i] into $t7
    sb $t7, 0($t3) # Store cArray[cArray_size - 1 - i] into &cArray[i]
    sb $t4, 0($t6) # Store cArray[i] into &cArray[cArray_size - 1 - i]
    addi $t1, $t1, 1 # Increment i by 1
    j loop # Loop back
end_loop:
    lw $ra, 4($sp) # Load $ra from the stack
    lw $a1, 0($sp) # Load $a1 from the stack
    addi $sp, $sp, 8 # Adjust stack pointer to free space
    jr $ra # Return from the function
#-------------------------------------------------------------------#
#Exit
#-------------------------------------------------------------------#
Exit:
