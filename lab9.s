.text
.global _start
.data
    array:
     	.dword 50, 40, 20, 30, 10, 6, 1, 2, 7, 3
    length:
        .quad 10
    sc:
        .string "%d"
    found:
    	.string "The query was found at index %d\n\0"
    notfound:
    	.string "The query is not in the array\n\0"
search:
	sub x10, x20, #1
	mov x13, #0
	loo: cmp x10, x13
	b.lt ex
	add x1, x10, x13
	lsr x1, x1, #1
	lsl x3, x1, #3
	ldr x2, [x19, x3]
	cmp x2, x23
	b.eq hasfound
	b.lt l5
	sub x10, x1, #1
	b loo
	l5: add x13, x1, #1 
	b loo
	ex: 
	sub sp, sp, #8
	stur x30, [sp, #0]
	adr x0, notfound
	bl printf
	b end
	hasfound: 
	sub sp, sp, #8
	stur x30, [sp, #0]
	adr x0, found
	bl printf
	end: ldr x30, [sp, #0]
	add sp, sp, #8
	br x30
selection_sort:
	mov x21, #0 //i
	sub x22, x20, #1 //length-1
	loop1: cmp x21, x22
	b.ge exit1
	mov x23, x21 //min index
	add x24, x21, #1 //j
	loop2: cmp x24, x20
	b.ge exit2
	lsl x2, x24, #3
	lsl x3, x23, #3
	ldr x25, [x19, x2] //array[j]
	ldr x26, [x19, x3] //array[min index]
	cmp x25, x26
	b.ge l
	mov x23, x24
	l: add x24, x24, #1
	b loop2
	exit2:
	lsl x4, x23, #3
	lsl x5, x21, #3
	ldr x7, [x19, x4] //x7 = array[min index]
	ldr x8, [x19, x5] //x8 = array[i]
	str x7, [x19, x5] //array[i] = array[min index]
	str x8, [x19, x4] //array[min index] = array[i]
	add x21, x21, #1
	b loop1	
	exit1:
	br x30
_start:
	adr x19, array
	ldr x8, =length
	ldr x20, [x8]
	bl selection_sort
	sub sp, sp, #8
   	adr x0, sc
   	mov X1, SP
   	bl scanf 
   	ldr X1, [SP]
   	add SP, SP, 8
   	mov x23, x1
    	mov X0, #0
    	mov w8, #93
    	svc #0
.end

