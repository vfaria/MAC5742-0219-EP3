#! /bin/bash

set -o xtrace

MEASUREMENTS=10

CLUSTER_SIZE=$1
SIZE=8192

make
mkdir results
mkdir results/mpi

perf stat -r $MEASUREMENTS mpirun -np $1 ./mandelbrot_mpi -2.5    1.5   -2.0    2.0   $SIZE >> full.log          2>&1
perf stat -r $MEASUREMENTS mpirun -np $1 ./mandelbrot_mpi -0.8   -0.7    0.05   0.15  $SIZE >> seahorse.log      2>&1
perf stat -r $MEASUREMENTS mpirun -np $1 ./mandelbrot_mpi  0.175  0.375 -0.1    0.1   $SIZE >> elephant.log      2>&1
perf stat -r $MEASUREMENTS mpirun -np $1 ./mandelbrot_mpi -0.188 -0.012  0.554  0.754 $SIZE >> triple_spiral.log 2>&1

mv *.log results/mpi
rm output.ppm