OUTPUT=mandelbrot

IMAGE=.ppm

EXECS=mandelbrot_mpi
CC=mpicc

all: ${EXECS}

mandelbrot_mpi: mandelbrot_mpi.c
	${CC} -o mandelbrot_mpi mandelbrot_mpi.c

clean:
	rm -f ${EXECS}
	rm $(OUTPUT)_mpi $(OUTPUT)_seq *$(IMAGE)
