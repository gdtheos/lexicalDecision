#!/bin/bash
#PBS -l walltime=12:00:00 
#PBS -l nodes=1:ppn=4
#PBS -o fullStorageOutput.txt
#PBS -e fullStorageError.txt
#PBS -r y
#PBS -N elpFullStorage
#PBS -A jjh-730-aa

source /software/soft.computecanada.ca.sh
module load boost/1.65.1
module load r/3.5.0
cd morphoProject/smallModels
Rscript fullStorage.R > fullStorage.txt
