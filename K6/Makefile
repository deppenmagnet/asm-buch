AS=nasm
ASFLAGS= -f elf64 -FDWARF -g -l $@.lst 
LDFLAGS=-m elf_x86_64
SOURCES = intadd.asm intsub.asm imul1.asm imul2.asm idiv1.asm ex1.asm ex2.asm ex3.asm
OBJECTS = $(SOURCES:.asm=.o)
TARGETS = intadd intsub imul1 imul2 idiv1 ex1 ex2 ex3

%.o : %.asm
		nasm -f elf64 -FDWARF -g -l $@.lst -o $@ $<


all: $(TARGETS)

intadd: intadd.o
	ld $(LDFLAGS) -o $@ $<

intsub: intsub.o
	ld $(LDFLAGS) -o $@ $<

imul1: imul1.o
	ld $(LDFLAGS) -o $@ $<

imul2: imul2.o
	ld $(LDFLAGS) -o $@ $<

idiv1: idiv1.o
	ld $(LDFLAGS) -o $@ $<

ex1: ex1.o
	ld $(LDFLAGS) -o $@ $<

ex2: ex2.o
	ld $(LDFLAGS) -o $@ $<

ex3: ex3.o
	ld $(LDFLAGS) -o $@ $<

clean:
	rm -rf *.lst *.o $(TARGETS)
