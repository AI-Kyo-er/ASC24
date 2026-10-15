# Source inventory

Files were selected from the team's local ASC collection. Paths in the source column refer to that collection, not to files required outside this repository.

| Repository material | Original source | Treatment |
| --- | --- | --- |
| `assets/team.jpg` | `papers/img/Chapter2/Group Photo.jpg` | Copied unchanged |
| `assets/second-class-prize.jpg` | Team ASC604 award certificate image | Copied unchanged |
| `assets/cluster-design.png` | `papers/graph/cluster.png` | Copied unchanged |
| `assets/llm-gpu-scaling.png` | Report Figure 5.1, PDF page 28 | Embedded image extracted |
| `assets/llm-ablation.png` | Report Figure 5.2, PDF page 30 | Embedded image extracted |
| `assets/opencaeporo-runtime.png` | Report Figure 6.6, PDF page 36 | Embedded image extracted |
| `reports/asc24-preliminary-report.pdf` | `submission/ASC_Team2_Zhongwei_Xie.pdf` | Renamed; contents unchanged |
| `reports/llm-inference-excerpt.pdf` | `submission/ASC_Team2_Zhongwei_Xie_4.pdf` | Renamed; contents unchanged |
| `tasks/hpl-hpcg/results/` | Two HPCG text logs in `submission/` | Copied unchanged |
| `tasks/llm-inference/llama/` | Four Llama 2 modules at the top level of `sync/` | Repackaged to match existing imports; contents unchanged |
| `tasks/llm-inference/example_text_completion.py` | `sync/example_text_completion.py` | Copied unchanged |
| `tasks/llm-inference/config/params.json` | `sync/params.json` | Copied unchanged |
| `tasks/llm-inference/profile.slurm` | `sync/baseline.sh` | English comments; grouped command construction; local checkpoint paths and profiling output path updated |
| `tasks/opencaeporo/submission/OpenCAEPoro.tar.gz` | `submission/OpenCAEPoro.tar.gz` | Copied unchanged |
| `tasks/opencaeporo/src/PETSC_FIM_solver.cpp` | Solver file inside the submission archive | Extracted unchanged |
| `tasks/opencaeporo/case1/` | `case1/` inside the submission archive | Extracted unchanged |

The original OpenCAEPoro log retains build-machine paths printed by the simulator. Those paths are historical log text, not runtime configuration for this repository.

## Scope

The collection also contains textbooks, research papers, a separate research slide deck, third-party repository copies, CUDA exercises, Llama 3 files, administrative spreadsheets, and multi-gigabyte profiling traces. These are outside this competition archive. Model weights, datasets, local environments, and generated build files are also excluded.

## Supporting license texts

Llama 2 license and use-policy texts were retrieved from the `llama_v2` branch of Meta's repository. The OpenCAEPoro license was retrieved from the ASC2024 distribution. GPLv3 is provided alongside LGPLv3. Upstream links and scope are recorded in [third-party notices](../THIRD_PARTY_NOTICES.md).
