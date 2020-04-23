#!/bin/bash
#SBATCH -J BV1
#SBATCH --account=d*****h
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G # 4G
#SBATCH -t 0-00:10 # Running time of 10 min

#Change to correct file path!
Rscript --vanilla $HOME/projects/d*****h/username/testRun.r $1 > $HOME/projects/d*****h/username/Rout/testRunOutput.$1.Rout 2>&1
