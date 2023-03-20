# NBIA-singularity
This repo contains a containerized version of the NBIA data retriever which makes it possible to directly download datasets in environments where root permissions are not granted (like HPCs).

# How to run
The nbia.sh file can be used to start the download of a dataset. It furthermore contains SLURM directives which makes it suitable for running on an HPC directly by executing "sbatch nbia.sh". 

Before you can start downloading the dataset you need to download the manifest file and put it in the "manifest"-folder. If you want to change the output folder (standard is "data") you need to adjust the variable "output_folder" in the script.

In the case you want to use a credentials-file you can add the file to the "credentials"-folder.

After execution the script will automatically download the singularity image on the first start, subsequently create a container from the image and start the nbia data retriever.