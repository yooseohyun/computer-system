.import ../dot.s
.import ../utils.s

# Set vector values for testing
.data
vector0: .word 1 2 3 4 5
vector1: .word 1 2 3 4 5


.text
# main function for testing
main:
    # Load vector addresses into registers
    la s0 vector0
    la s1 vector1

    # Set vector attributes
    li s2 9
    li s3 1
    li s4 1

    # Call dot function
    
    mv a0 s0
    mv a1 s1
    mv a2 s2
    mv a3 s3
    mv a4 s4
    jal ra dot

    # Print integer result

    addi a1 a0 0
    addi a0 x0 1
    ecall

    # Print newline

    li a1 '\n'
    jal print_char

    # Exit
    jal exit
