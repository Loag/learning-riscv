default:
	rm -rf dist
	riscv64-linux-gnu-as main.s -o main.o
	riscv64-linux-gnu-gcc -o dist main.o -nostdlib -static
	rm -rf main.o