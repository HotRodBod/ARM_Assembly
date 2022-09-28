.text
.global _start
.data
    a:
        .quad 6
    b:
        .quad 8
    c:
        .quad 3
    d:  
        .quad -2 
    print_num:
        .ascii "%d\n\0"
_start:
    ldr X8, =a
    ldr X2, [x8]
    ldr X8, =b
    ldr X3, [x8]
    ADD X5, X2, X3
    SUB X9, X5, #14
    CBNZ X9, L2
    MOV X1, #3
    B L4
    
    L2: 
    	MOV X1, -2
    	
    L4:
    	LDR X0, =print_num
    	bl printf
    	MOV X0, #0
    	MOV w8, #93
    	svc #0
.end
    	
