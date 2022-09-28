.text
.global _start
.data
    i:
        .quad 4
    g:
        .quad 3
    print_num:
        .ascii "%d\n\0"
_start:
    LDR X8, =i
    LDR X2, [x8]
    LDR X8, =g
    LDR X3, [x8]
    SUB X9, X2, #4
    CBNZ X9, L1
    ADD X1, X3, #1
    B L3
    L1:
        SUB X1, X3, #2
    L3: 
    	LDR X0, =print_num
    	bl printf
    	MOV X0, #0
    	MOV w8, #93
    	svc #0
.end

