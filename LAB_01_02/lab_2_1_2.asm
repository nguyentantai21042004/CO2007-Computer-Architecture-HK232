.data
msg:    .asciiz "Ket qua: "

.text
main:
    # Load 200000 (DEC) into $t0
    li $t0, 0                  # Clear $t0
    ori $t0, $t0, 0x0D40       # Load the lower 16-bits directly into $t0
    li $t1, 0x3                # Load upper 16-bits into $t1
    sll $t1, $t1, 16           # Shift left 16 bits
    or $t0, $t0, $t1           # Combine the upper and lower parts

    # Add 4000 to $t0
    addi $t0, $t0, 4000

    # Subtract 700 from $t0
    addi $t0, $t0, -700
		
    li $v0, 1                  # Load the print integer syscall code
    move $a0, $t0              # Move the result into $a0
    syscall
	
    li $v0, 10
    syscall 
