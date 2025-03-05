.section .data
  buffer:
	  .fill 256, 1, 0
  file:
    .asciz "test.txt"
.section .text
  .global _start

_start:
  ldr x0, =buffer
  mov x1, #256
  mov x8, #17
  svc #0

  mov x0, #1
  ldr x1, =buffer
  mov x2, #256
  mov x8, #64
  svc #0

  mov x0, #-100
  ldr x1, =file      
  mov x2, #0x42
  mov x3, #0     
  mov x8, #56   
  svc #0

  mov x19, x0

  mov x0, x19
  mov x1, #0x1FF
  mov x8, #52
  svc #0

  mov x0, x19            
  mov x8, #57            
  svc #0

  mov x0, #1
  mov x8, #93
  svc #0