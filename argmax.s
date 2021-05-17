.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 is the pointer to the start of the vector
#	a1 is the # of elements in the vector
# Returns:
#	a0 is the first index of the largest element
# =================================================================
argmax:

	li t0 0
	li t3 0

loop_start:

	slli t1 t0 2
	add t1 t1 a0
	lw t2 0(t1)
	addi t0 t0 1
	beq t0 a1 loop_end
	blt t3 t2 loop_continue
	j loop_start

loop_continue:
	
	add t4 t1 x0
	add t3 t2 x0
	j loop_start


loop_end:
    
	add a0 t4 x0

    ret
