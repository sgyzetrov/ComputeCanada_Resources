#!/bin/bash
#SBATCH -J BV1
#SBATCH --account=def-ubcxzh
#SBATCH --cpus-per-task=1
#SBATCH --mem=100 # 100M
#SBATCH -t 0-00:10 # Running time of 10 min

Rscript --vanilla $HOME/projects/def-ubcxzh/username/testRun.r $1 > $HOME/projects/def-ubcxzh/username/Rout/testRunOutput.$1.Rout 2>&1
