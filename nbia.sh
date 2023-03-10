#!/bin/sh
#SBATCH -J XNAT
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 7                # Cores assigned to each tasks
#SBATCH --time=0-24:00:00
#SBATCH -p batch

output_folder=data
input_folder=manifest

mkdir -p $output_folder
mkdir -p $input_folder

module load Utilities/Singularity

if ! test -f "nbia.sif"; then
    echo "Singularity container needs to be build"
    singularity build --fakeroot nbia.sif nbia.def
    echo "Singularity container was built"
fi

singularity run --fakeroot --no-home --writable \
-B $output_folder:/nbia/data \
-B $input_folder:/nbia/manifest \
nbia.sif \
nbia