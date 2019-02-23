#!/bin/bash
#PBS -l walltime=320:00:00 
#PBS -l nodes=1:ppn=4
#PBS -A jjh-730-aa
#PBS -o fullDecompOutput.txt
#PBS -e fullDecompError.txt
#PBS -r y
#PBS -N elpFullDecomposition

source /software/soft.computecanada.ca.sh
module load boost/1.65.1
module load r/3.5.0
cd morphoProject
Rscript fullDecomposition.R > fullDecomposition.txt
