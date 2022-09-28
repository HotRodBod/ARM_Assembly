.text
.global _start
_start:
	adr x0, a
	ldur d21, [x0]
	adr x0, b
	ldur d22, [x0]
	adr x0, n
	ldur d27, [x0]
	movi d0, #0 //total
	fsub d5, d22, d21 
	fdiv d5, d5, d27 //width of rectangle
	fmov d18, d21 //tracker
	movi d2, #0
	loop: fcmp d2, d27
	b.eq end
	fmul d7, d18, d18 //x^2
	fmul d8, d7, d18 //x^3
	fmov d3, #2.5
	fmul d4, d3, d8 //round count
	fmov d3, #15.5
	fmul d3, d3, d7
	fsub d4, d4, d3
	fmov d3, #20.0
	fmul d3, d3, d18
	fadd d4, d4, d3
	fmov d3, #15.0
	fadd d4, d4, d3
	fadd d0, d0, d4
	fadd d18, d18, d5
	fmov d3, #1.0
	fadd d2, d2, d3
	b loop
	end: 
	LDR X0, =print_num
	fmul d0, d0, d5
	adr x1, result
	ldur d1, [x1]
	fsub d2, d0, d1
    	bl printf
    	MOV X0, #0
    	MOV w8, #93
    	svc #0
.data   
    a: .double -.5
    b: .double 5.0
    n: .double 1000.0
    result: .double 74.1067708333
    print_num: .ascii "guess: %lf actual: %lf difference: %lf\n\0"
.end

