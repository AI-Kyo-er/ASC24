#!/usr/bin/env bash
#SBATCH --cluster=priv
#SBATCH --account=asc
#SBATCH --partition=priv_pj
#SBATCH --job-name=llama2-profile
#SBATCH --gres=gpu:8
#SBATCH --ntasks=8
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=72:00:00
#SBATCH --output=./log/%j.log

# Cluster environment
module load nvidia/cuda/11.6
module load scl/gcc11.2
module load cmake/3
module load nvidia/hpcsdk/2023
nvidia-smi

# Distributed runtime
export OMP_NUM_THREADS=8
export MASTER_ADDR=$(hostname)
export MASTER_PORT=12345

# Profiling output
nsys_output_dir="/data1/sieniwgroup/sieniw/projects/asc24/nsys-reports"
mkdir -p "${nsys_output_dir}"
nsys_output_prefix="${nsys_output_dir}/${SLURM_JOB_NAME}_${SLURM_JOB_ID}"

# Python
python_command="python -m torch.distributed.launch"
python_file="./example_text_completion.py"
command="nsys profile -o ${nsys_output_prefix} --force-overwrite true ${python_command}"

# Model parallelism
command+=" --nproc_per_node=8"
command+=" --nnodes=1"
command+=" --node_rank=0"
command+=" --master_addr=${MASTER_ADDR}"
command+=" --master_port=${MASTER_PORT}"
command+=" ${python_file}"

# Checkpoint and tokenizer
command+=" --ckpt_dir=./checkpoints/llama-2-70b"
command+=" --tokenizer_path=./checkpoints/llama-2-70b/tokenizer.model"

echo "$command"
eval "$command"
