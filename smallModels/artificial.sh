#!/bin/bash
#PBS -l walltime=24:00:00 
#PBS -l nodes=1:ppn=4
#PBS -A jjh-730-aa
#PBS -o artificialOutput.txt
#PBS -e artificialError.txt
#PBS -r y
#PBS -N elpFullStorage

source /software/soft.computecanada.ca.sh
module load boost/1.65.1
module load r/3.5.0
cd morphoProject
Rscript artificial.R > artificial.txt
