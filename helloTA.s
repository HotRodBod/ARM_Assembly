 .text
.global _start

_start:
   mov x19, #-1
   mov x8, #63
   mov x18, #-1
   mov x20, #-1
   mov x30, #0
store:
   add x19, x19, #1
   mov x0, #0
   adr x1, buf
   add x1, x1, x19
   mov x2, #1
   svc 0
   ldr x4, [x1, 0]
   cmp x4, #10
   bne store
   adr x1, buf
   adr x26, buf
   mov w20, #0 
   mov w5,  #10

buf2num: 
   ldrb w22, [x26, #0]
   cmp w22, #10
   beq square
   mul w20, w20, w5
   sub w22, w22, #48
   add w20, w20, w22
   add x26, x26, #1
   b buf2num

square:
   mul w20, w20, w20
   mov x13, #10
   adr x1,  ans
   mov x16, x20
   cmp x20, xzr
   beq zero
   mov x12, #0
   numdigit: cmp x16, xzr
   beq num2string
   udiv x16, x16, x13
   add x12, x12, #1
   b numdigit
   zero: mov x12, #1

num2string: 
   mov x23, x20
   mov w11, #10
   adr x1,  ans
   add x15, X1, x12
   add x15, x15, #1
   sturb w11, [x15]
   save: cmp x12, xzr
   beq print
   udiv x22, X23, x13 
   msub x24, x22, x13, x23 
   udiv X23, X23, x13 
   add w24, w24, #48 
   add x15, x1, x12 
   sturb w24, [x15]
   sub x12, x12, #1
   b save
print:
   add x18, x18, #1
   adr x1, ans
   add x1, x1, x18    
   mov x8, #64
   mov x0, #1
   mov x2, #1
   svc 0
   ldr x4, [x1, 0]
   cmp x4, #10
   beq exit
   b print
exit:
   mov x0, #0
   mov x8, #93
   svc 0
.bss
   buf: .skip 1000
   ans: .skip 1000
.end
