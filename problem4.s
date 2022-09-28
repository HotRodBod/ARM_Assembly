.text
.global _start
.data
    list:
     	.word 1, 0, 4, 6, 5, 6, 3, 1
    count:
        .quad 0
print_num:
    .ascii "%d\n\0"
_start:
    LDR X8, =count
    LDR X1, [x8]
    MOV X10, 0
Loop:
    CMP X10, #8
    B.EQ Exit
    MOV x4, x10, LSL #2
    LDR X8, =list
    LDR X0, [X8, X4]
    ADD X1, X1, X0
    ADD X10, X10, #1
    B Loop
Exit:
    LDR X0, =print_num
    bl printf
    MOV X0, #0
    MOV w8, #93
    svc #0
.end

