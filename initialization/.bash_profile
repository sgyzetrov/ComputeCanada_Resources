# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

module load r
export R_LIBS=~/R/library

module load python/3.6
source $HOME/jupyter_py3/bin/activate

module load rstudio-server