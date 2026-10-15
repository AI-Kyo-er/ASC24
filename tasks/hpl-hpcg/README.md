# HPL and HPCG

## HPL

Chapter 4 of the [competition report](../../reports/asc24-preliminary-report.pdf) describes HPL experiments with NVIDIA HPC-Benchmarks 23.10 in Singularity. Tuning topics include problem size, block size, MPI process grids, affinity, and communication.

No HPL executable, configuration file, or raw result log was retained in this collection. Consult the report for the original account; its HPL performance figure is not independently verifiable from the files here.

## HPCG

The `results/` directory preserves the output from January 20, 2024:

- [Benchmark summary](results/HPCG-Benchmark_3.1_2024-01-20_22-16-15.txt)
- [Iteration and residual log](results/hpcg20240120T221246.txt)

| Field | Recorded value |
| --- | --- |
| HPCG version | 3.1 |
| MPI processes | 8 |
| Threads per process | 1 |
| Process grid | 2 × 2 × 2 |
| Local domain | 104 × 104 × 104 |
| Global domain | 208 × 208 × 208 |
| Final rating, including overhead | 3.66093 GFLOP/s |
| Benchmark time | 89.658 s |
| Numerical verification | Passed |

The run is a short benchmark record. Its numerical checks passed, but it does **not** meet the 1,800-second duration requirement for an official HPCG result. The log also identifies reference implementations of the dot product, SpMV, multigrid, and WAXPBY routines.

The report's test-method paragraph describes a larger allocation. The table above follows the actual saved log rather than that paragraph.

For benchmark source and run requirements, see the [official HPCG repository](https://github.com/hpcg-benchmark/hpcg).
