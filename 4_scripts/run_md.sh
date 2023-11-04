#!/bin/bash
#SBATCH --job-name="prod"
#SBATCH --partition=normal
#SBATCH --gres=gpu:1
#SBATCH -n 24
#SBATCH --output=logs_%j.out
#SBATCH --error=logs_%j.err
#SBATCH --time=120:30:00


##### GROMACS GPU*1+24核 #########

echo Begin time is `date`
echo "The job id is : $SLURM_JOBID "
echo -n 'Nodelist is : '
echo $SLURM_JOB_NODELIST
echo -n 'We work on: '
echo $SLURM_SUBMIT_DIR
#################################
source /opt/oneapi/setvars.sh intel64
source /opt/gmx2021.5/bin/GMXRC

gmx grompp -f minim.mdp -c ions.gro -p topol.top -o em.tpr
gmx mdrun -deffnm em

gmx grompp -f eq*.mdp -c em.gro -p topol.top -o eq.tpr
gmx mdrun -deffnm eq

gmx grompp -f md_*.mdp -c eq.gro -r eq.gro -p topol.top -o prod.tpr
gmx mdrun -deffnm prod -ntmpi 1 -ntomp 24
#################################
echo Job Done!
echo End time is `date`
#################################

