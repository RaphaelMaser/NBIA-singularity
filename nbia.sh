#!/bin/sh
#SBATCH -J XNAT
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 2                # Cores assigned to each tasks
#SBATCH --time=0-24:00:00
#SBATCH -p batch

output_folder=data
input_folder=manifest

mkdir -p $output_folder
mkdir -p $input_folder

module load tools/Singularity

singularity run --userns --no-home --writable \
-B $output_folder:/nbia/data \
-B $input_folder:/nbia/manifest \
library://raphaelm/nbia-singularity/nbia.sif:latest \
nbia