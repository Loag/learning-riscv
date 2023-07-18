.section .data
str: 
  .asciz "Hello\n"

.section .text
.global _start
_start:

  # call syscall write
  li    a0, 1 # set the first parameter to 1 for stdout
  la    a1, str  # set second paramter to a pointer to a buffer
  li    a2, 7 # set third parameter to the number of bytes to write
  li    a7, 64 # set syscall to linux syscall write
  ecall

  # end the program
  call terminate

terminate:
  li    a0, 0   # put zero in the the return register (x10 or abi a0)
  li    a7, 93  # put 93 (linux syscall number for exit 0) in x17 or abi a7
  ecall   # control is transfered to the os. it looks at a7 to get the sys call to perform
