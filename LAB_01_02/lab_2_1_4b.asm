.data
    input_string: .asciiz "2212990 - Nguyen Tan Tai"
    temp_char:    .byte 0   # Temporary variable to hold a character

.text
main:
    la $t0, input_string          # Load address of input_string into $t0
    
    lb $t1, 0($t0)                # Load first byte of input_string into $t1
    sb $t1, temp_char             # Store first byte in temp_char

    # Find the end of the string
find_end:
    lb $t2, 0($t0)                # Load byte at $t0 into $t2
    beq $t2, $zero, found_end    # If byte is null terminator, go to found_end
    addi $t0, $t0, 1             # Otherwise, move to the next byte
    j find_end

found_end:
    addi $t0, $t0, -1            # Adjust $t0 to point to the last character before the null terminator

    lb $t2, 0($t0)                # Load last character into $t2
    la $t3, input_string
    sb $t2, 0($t3)               # Swap it with the first character

    lb $t4, temp_char
    sb $t4, 0($t0)               # Put the first character at the end
    
    # For demonstration purposes, print the modified string
    li $v0, 4                    # Load 'print string' syscall code into $v0
    la $a0, input_string         # Load address of the modified string
    syscall                      # Execute syscall

    # End the program
    li $v0, 10
    syscall
