.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 is the pointer to the start of v0
#   a1 is the pointer to the start of v1
#   a2 is the length of the vectors
#   a3 is the stride of v0
#   a4 is the stride of v1
# Returns:
#   a0 is the dot product of v0 and v1
# =======================================================
dot:

    li t0 0
    li t1 0
    li t2 0
    li t3 0
    li t4 0
    li t5 0

loop_start:

    mul t1 t0 a3
    mul t2 t0 a4

    slli t1 t1 2
    slli t2 t2 2

    add t3 a0 t1
    add t4 a1 t2

    add t1 t1 a3
    add t2 t2 a4

    beq t0 a2 loop_end

    addi t0 t0 1

    lw t3 0(t3)
    lw t4 0(t4)
    mul t3 t3 t4
    add t5 t5 t3

    j loop_start

loop_end:

    addi a0 t5 0
    # Epilogue
   
    ret
