.import ../matmul.s
.import ../utils.s
.import ../dot.s

# static values for testing
.data
m0: .word 1 3 5 7 9 11 13 15 17
m1: .word 6 15 24                         
d: .word 0 0 0 0 0 0 0 0 0 # allocate static space for output

.text
main:
    # Load addresses of input matrices (which are in static memory), and set their dimensions
	
	la s0 m0
	li s1 3
	li s2 3
	la s3 m1
	li s4 3
	li s5 1
	la s6 d

    # Call matrix multiply, m0 * m1

	mv a0 s0
	mv a1 s1
	mv a2 s2
	mv a3 s3
	mv a4 s4
	mv a5 s5
	mv a6 s6
	jal ra matmul

    # Print the output (use print_int_array in utils.s)

	mv a1 a2
	mv a0 a6
	mv a2 a5
	jal ra print_int_array


    # Exit the program
    jal exit
