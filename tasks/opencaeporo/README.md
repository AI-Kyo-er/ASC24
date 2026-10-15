# OpenCAEPoro

Our optimization work focused on the PETSc CPR linear solver and MPI process placement. This directory contains the submitted solver file, the `case1` inputs and outputs, and the original submission archive.

## Solver changes

The [submitted solver](src/PETSC_FIM_solver.cpp) contains the changes described in Section 6.2.3 of the [report](../../reports/asc24-preliminary-report.pdf):

- Count diagonal and off-diagonal nonzeros in a single pass.
- Hoist repeated index multiplications outside inner loops.
- Unroll index construction for matrix and vector assembly.

The target function is `FIM_solver_p_cpr`. The source is preserved as submitted; it has not been refactored or rebuilt for this repository.

## Results

The report compares original and modified code with one and ten MPI processes. It selects ten processes on a single node after observing additional communication cost in the two-node experiments. The reported overall speedup is more than 4.8× against the original single-process run.

![Runtime comparison from the competition report](../../assets/opencaeporo-runtime.png)

The retained [`case1` log](case1/testOpenCAEPoro.log) records:

| Measurement | Value |
| --- | --- |
| Grid | 80 × 80 × 40 |
| MPI ranks in the statistics file | 10 |
| Final simulated time | 3,600 days |
| Simulation wall time | 1,274.472 s |
| Linear solver time | 1,132.951 s |
| Linear solver share | 88.896% |
| Object time, as labeled by the program | 207.899 s |

The log includes nonlinear convergence warnings and time-step reductions before reaching the final simulated time. The preserved outputs include [SUMMARY.out](case1/SUMMARY.out), [SUMMARY_ref.out](case1/SUMMARY_ref.out), [FastReview.out](case1/FastReview.out), and [per-rank statistics](case1/statistics.out). Their presence does not establish a fresh numerical validation. The 4.8× comparison comes from the report; the corresponding complete baseline log set is not retained here.

## Build context

The [official ASC2024 distribution](https://github.com/OpenCAEPlus/OpenCAEPoro_ASC2024) supplies the complete source and build instructions. Its dependencies include LAPACK 3.11, ParMETIS 4.0.3, hypre 2.28.0, PETSc 3.19.3, and the PETSc solver wrapper.

The team's report records the cluster modules `cmake/3`, `scl/gcc7.3`, `intel/oneapi/2021`, and `mpich/3.4.1-intel2021`.

The [submission archive](submission/OpenCAEPoro.tar.gz) contains `OpenCAEPoro/src/`, `petsc_solver/src/PETSC_FIM_solver.cpp`, and `case1/`. It does not contain the complete headers, dependency sources, or top-level build configuration. Start from the full competition distribution, compare the submitted source with that version, and rebuild both the solver wrapper and simulator before attempting reproduction.

## Source and terms

OpenCAEPoro is upstream software, not an implementation authored entirely by this team. The snapshot contains the team's submitted changes alongside upstream code. The competition distribution provides the [LGPLv3 license](LICENSE); the source headers specify LGPLv3 or later. The accompanying [GPLv3 text](COPYING.GPL-3.0) is included because LGPLv3 incorporates it.
