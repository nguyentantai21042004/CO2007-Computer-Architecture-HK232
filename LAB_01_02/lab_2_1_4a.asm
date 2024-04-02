.data
    array_data: .word 2, 5, 7, 2, 4, 5, 12, 53, 214, 42

.text
main:
    # Load base address of array_data into $s0
    la $s0, array_data

    # Load giá trị của phần tử thứ 4 và 6 using the base address in $s0
    lw $t0, 12($s0)  # Phần tử thứ 4
    lw $t1, 20($s0)  # Phần tử thứ 6

    # Tính hiệu
    sub $t2, $t0, $t1
    
    # Print the result
    li $v0, 1       # System call for print_int
    move $a0, $t2   # Move the result to $a0
    syscall
    
    # Exit the program
    li $v0, 10
    syscall
