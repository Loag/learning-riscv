# -nostdlib -static
default:
	rm -rf dist
	riscv64-linux-gnu-as main.s -o main.o
	riscv64-linux-gnu-gcc -nostartfiles -static -o dist main.o
	rm -rf main.o
	readelf -a dist > inspection