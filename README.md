# julia-mpi-fsbench

Naive benchmark of a toy MPI application in which we place the Julia depot (i.e. `JULIA_DEPOT_PATH`) on different file systems at the [Paderborn Center for Parallel Computing (PC2)](https://pc2.uni-paderborn.de/). Run on the normal compute nodes of [Noctua 2](https://pc2.uni-paderborn.de/hpc-services/available-systems/noctua2) (dual-socket AMD EPYC Milan 7763 64-Core CPUs).

## Acknowledgements

Heavily inspired by a similar Python benchmark run at NERSC: https://gitlab.com/NERSC/python-benchmark/-/tree/main/shifter-vs-filesystems.

## Results

| Number of nodes    | PC2PFS              | HOME                          | Container      |
|--------------------|---------------------|-------------------------------|----------------|
| 1                  | 0m5.255s            | tbd                           | tbd            |
| 2                  | 0m5.411s            | tbd                           | tbd            |
| 10                 | 0m5.705s            | tbd                           | tbd            |
| 100                | tbf                 | tbd                           | tbd            |
| 500                | tbd                 | tbd                           | tbd            |
