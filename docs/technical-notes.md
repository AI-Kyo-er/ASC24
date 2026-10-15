# Technical notes

The report covers three application tasks alongside the HPC system proposal. This page identifies the useful entry points and the evidence retained for each task.

## HPL and HPCG

The HPL chapter discusses problem size, block size, process grids, and process placement using NVIDIA HPC-Benchmarks 23.10 with Singularity. The saved materials do not include an HPL output log or `HPL.dat`, so the report's HPL performance claim cannot be checked against a raw run here.

The HPCG records are more complete: an eight-process run, one thread per process, and a local domain of 104 × 104 × 104. Its final rating is 3.66093 GFLOP/s. Numerical checks passed, but the 89.658-second run was shorter than the official 1,800-second requirement. It also used the reference computational kernels.

Read the [benchmark notes](../tasks/hpl-hpcg/README.md) before comparing these values with other systems.

## Llama 2 inference

The report explores GPU execution, parameter settings, and KV caching. The retained code uses FairScale model-parallel layers, autoregressive generation, and NVTX ranges around generation stages.

The local Llama 2 snapshot is useful for inspecting the implementation and profiling workflow. It is a small text-completion example, not the complete competition evaluator. There is no saved dependency lockfile or complete raw ablation log.

The [inference notes](../tasks/llm-inference/README.md) include the original figures and explain how the source is arranged. The separate LLM PDF is an excerpt of Chapter 5, not an additional experiment report.

## OpenCAEPoro

Profiling identified `FIM_solver_p_cpr` as the main optimization target. The report describes combining the diagonal/off-diagonal nonzero counting loops, moving repeated multiplications out of inner loops, and unrolling index construction. The retained solver contains these changes.

The team compared one and two nodes, then selected 10 MPI processes on a single node. The report records more than 4.8× speedup relative to the unmodified single-process baseline. The case output preserves the final simulation timing and per-rank statistics; the complete set of baseline timing logs is not present.

See the [solver notes](../tasks/opencaeporo/README.md) for dependencies, the submitted source, and the case files.
