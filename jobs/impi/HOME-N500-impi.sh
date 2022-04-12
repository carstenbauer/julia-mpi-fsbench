#!/bin/bash -l

#SBATCH -t 00:30:00
#SBATCH -N 500
#SBATCH --exclusive
#SBATCH -n 32000
#SBATCH -c 2
#SBATCH -A pc2-mitarbeiter
#SBATCH -p normal
#SBATCH -q cont
#SBATCH -o HOME-N500-impi.out

export OMP_NUM_THREADS=1
export OMP_PLACES=threads
export OMP_PROC_BIND=spread
# export OMPI_MCA_hwloc_base_report_bindings=false

export JULIA_DEPOT_PATH=/upb/departments/pc2/users/b/bauerc/.julia_fsbench
export JULIA_MPI_BINARY=system

ml lang
ml Julia
ml load mpi/impi/2021.5.0-intel-compilers-2022.0.1 

echo "starting N 500 trials"
echo "Julia depot located at $JULIA_DEPOT_PATH"
for i in {1..5}
do
   time srun --cpu_bind=cores julia --project=/scratch/pc2-mitarbeiter/bauerc/devel/julia-mpi-fsbench /scratch/pc2-mitarbeiter/bauerc/devel/julia-mpi-fsbench/bench.jl
   # time srun --cpu_bind=cores julia --project=/scratch/pc2-mitarbeiter/bauerc/devel/julia-mpi-fsbench /scratch/pc2-mitarbeiter/bauerc/devel/julia-mpi-fsbench/bench.jl verbose
   echo "N 500 trial $i completed"
   sleep 10
done

