# julia-mpi-fsbench

Naive benchmark of a toy MPI application in which we place the Julia depot (i.e. `JULIA_DEPOT_PATH`) on different file systems at the [Paderborn Center for Parallel Computing (PC2)](https://pc2.uni-paderborn.de/). Run on the normal compute nodes of [Noctua 2](https://pc2.uni-paderborn.de/hpc-services/available-systems/noctua2) (dual-socket AMD EPYC Milan 7763 64-Core CPUs).

## Acknowledgements

Heavily inspired by a similar Python benchmark run at NERSC: https://gitlab.com/NERSC/python-benchmark/-/tree/main/shifter-vs-filesystems.

## Results

### OpenMPI

| Number of nodes    | PC2PFS              | HOME                          | Container      |
|--------------------|---------------------|-------------------------------|----------------|
| 1                  | 0m5.255s            | 0m5.713s                      | tbd            |
| 2                  | 0m5.411s            | 0m6.149s                      | tbd            |
| 10                 | 0m5.705s            | 0m7.529s                      | tbd            |
| 100                | 0m11.984s           | 0m18.926s                     | tbd            |
| 500                | tbd                 | tbd                           | tbd            |

### IntelMPI

| Number of nodes    | PC2PFS              | HOME                          | Container      |
|--------------------|---------------------|-------------------------------|----------------|
| 1                  | 0m4.198s            | 0m4.614s                      | tbd            |
| 2                  | 0m4.212s            | 0m4.876s                      | tbd            |
| 10                 | tbf                 | tbf                           | tbd            |
| 100                | tbd                 | tbd                           | tbd            |
| 500                | tbd                 | tbd                           | tbd            |
