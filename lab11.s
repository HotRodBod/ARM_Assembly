/*Lab 11 Solution*/


.text
.global _start
.extern printf

_start:
	mov 	x8,  #0  
	mov	x9,  #1  
	adr	x0, max
	ldur	d9, [x0] 
	movi	d8, #0   
	movi	d1, #0
	
	adr 	x5, x    
	adr	x6, y
	adr 	x0, N
	ldur    x7, [x0] 
	
	mov	x1, #0 //largest
	mov	x2, #1 //indexes
	mov	x3, #0 //smallest
	mov	x4, #1 //indexes
	
	inner:	cmp x8, x7
	b.eq 	exit
	inneri: cmp x9, x7
	b.eq exit2
	mov	x11, #8
	mul	x10, x8, x11
	ldr	d10, [x5, x10] 
	ldr	d11, [x6, x10] 
	mul	x10, x9,x11
	ldr	d12, [x5, x10] 
	ldr	d13, [x6, x10] 
	dist: 	fsub d10, d10, d12
	fmul	d10, d10, d10
	fsub	d11, d11, d13
	fmul	d11, d11, d11
	fadd 	d11, d10, d11
	fcmp	d8, d1
	b.ne	e
	fmov	d8, d11
	e: fcmp d11, d9
	b.ge 	updatemax
	b next
	updatemax: fmov d9, d11
	mov	x1, x8
	mov	x2, x9
	next: fcmp d11, d8
	b.le 	updatemin
	b nnext
	updatemin: fmov d8, d11
	mov	x3, x8
	mov	x4, x9
	nnext: add x9, x9, #1
	b inneri
	exit2:
	add 	x8, x8, #1
	add 	x9, x8, #1
	b inner
exit:
	ldr x0, =printarr
	bl printf
	mov x0, 0
	mov x8, 93
	svc 0
	
.data
N:
	.dword 8
max: 
	.double 0.0
x:
	.double 0.0, 0.4140, 1.4949, 5.0014, 6.5163, 3.9303, 8.4813, 2.6505
y:
	.double 0.0, 3.9862, 6.1488, 1.047, 4.6102, 1.4057, 5.0371, 4.1196
printarr:
	.ascii "longest x,y index is: %d %d\nshortest x,y index is: %d %d\n\0"

.end

