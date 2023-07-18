.global _start
_start:

  li    x5, 100 # put 100 in reg 5
  li    x6, 100

  add   x7, x6, x5

  

  # end the program
  call terminate

terminate:
  li    x10, 0   # put zero in the the return register (x10 or abi a0)
  li    x17, 93  # put 93 (linux syscall number for exit 0) in x17 or abi a7
  ecall   # control is transfered to the os. it looks at a7 to get the sys call to perform
