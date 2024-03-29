#!/bin/bash -l
#SBATCH -J NBIA
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 2                   # Cores assigned to each tasks
#SBATCH --time=0-24:00:00
#SBATCH -p batch

output_folder=data

mkdir -p $output_folder

module load tools/Singularity/3.8.1

singularity run --userns --no-home --writable \
-B $output_folder:/nbia/data \
-B manifest:/nbia/manifest \
-B credentials:/nbia/credentials \
library://raphaelm/nbia-singularity/nbia.sif:latest \
nbia

