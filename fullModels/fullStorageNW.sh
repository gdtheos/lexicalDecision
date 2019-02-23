#!/bin/bash
#PBS -l walltime=320:00:00 
#PBS -l nodes=1:ppn=4
#PBS -A jjh-730-aa
#PBS -o fullStorageNWOutput.txt
#PBS -e fullStorageNWError.txt
#PBS -r y
#PBS -N elpFullStorage

source /software/soft.computecanada.ca.sh
module load boost/1.65.1
module load r/3.5.0
cd morphoProject
Rscript fullStorageNW.R > fullStorageNW.txt
