.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 is the pointer to the array
#	a1 is the # of elements in the array
# Returns:
#	None
# ==============================================================================
relu:
    # Prologue
	
	li t0 1
	li t1 0
	li t2 0
	li t3 0
	li t4 0

loop_start:

	slli t2 t1 2
	add t3 t2 a0
	add t1 t0 t1
    	addi t5 t1 -1
    	beq t5 a1 loop_end
	lw t4 0(t3)
	blt t4 x0 loop_continue
	j loop_start

loop_continue:

	sw x0 0(t3)
	j loop_start

loop_end:

	ret
