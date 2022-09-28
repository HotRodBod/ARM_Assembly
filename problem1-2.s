.text
.global _start
.data
    print_num:
        .ascii "%d\n\0"     
ARRAY:
	.dword 1,22,8,4,10
_start:
	ADR X6, ARRAY
	MOV X0, #5
	BL maxfinderfunction
	BL end
maxfinderfunction:
	SUB SP, SP, #16
	STUR X30, [SP, #8]
	STUR X0, [SP, #0]
	CMP X0, #1
	BGT L1
	LDUR X1, [X6, #0]
	ADD SP, SP, #16
	BR X30
L1:
	SUB X0, X0, #1
	BL maxfinderfunction
	LDUR X0, [SP, #0]
	LDUR X30, [SP, #8]
	ADD SP, SP, #16
	ADD X6, X6, #8
	LDR X5, [X6]
	CMP X5, X1
	BGT L2
	BR X30
L2: 
	MOV X1, X5
	BR X30
end: 
	LDR X0, =print_num
    	bl printf
    	MOV X0, #0
    	MOV w8, #93
    	svc #0
.end

