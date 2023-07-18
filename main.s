.global _start
_start:

  addi    x5, x0, 100
  
  addi    x10, x0, 0   # add zero and zero and put it in the the return register (x10 or abi a0)
  addi    x17, x0, 93  # add zero and 93 (linux syscall number for exit 0) and put it in x17 or abi a7
  ecall   # control is transfered to the os. it looks at a7 to get the sys call to perform 

