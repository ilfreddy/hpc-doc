#!/bin/bash -l

###################################################
#
#  Star CCM+ job example script
#
###################################################
#
#SBATCH --job-name=StarCCM+ex
#Running on default account, thus commented out the account giving comment:
##SBATCH --account=
# Stallo has 16 or 20 cores/node and therefore we take
# a number that is divisible by both:
#SBATCH --ntasks=80
#Run for 2 Hrs (format is day-hrs:mins:secs)
#SBATCH --time=0-02:00:00
# In slurm, memory is hardlimit. Be carefull!
#SBATCH --mem-per-cpu=1500MB
# Normal partition should do it
#SBATCH --partition=normal
#
 
##############
# Setting software environment for STAR CCM+

module purge
module load STAR-CCM+/STAR-CCM+12.02.010
# Potentially; ml Mesa/11.2.1-intel-2016a
##############
# Setting up real time license on demand.
# Users must specify their <licensekey>
#

#export LM_PROJECT=<licensekey>
export CDLMD_LICENSE_FILE=1999@flex.cd-adapco.com

#############
#Setting up work environment and preparing for job to run:

# Specifying project name:
case=$SLURM_JOB_NAME
#Setting home for mpi:
export INTEL_MPI_HOME=$EBROOTIIMPI
# Moving to submit folder: 
export submitdir=$SLURM_SUBMIT_DIR
cd $submitdir
# Definining, and creating if necessary, a temporary work directory:
export tempdir=/global/work/${USER}/starccm/${SLURM_JOBID}
mkdir -p $tempdir
# Copy inputfile and move to working directory
cp $case.sim $tempdir
cd $tempdir
# Defining number of mpi tasks to feed the mpi engine:
procs=$(echo $SLURM_NPROCS)
 
###############
# Starting the program:

srun starccm+ -batch -power -pio $case.sim

# Preferable options: -mesa.


# Investigate potentially other files to keep:
echo `pwd`
echo `ls -ltr`

# ALLWAYS clean up after yourself. Please do uncomment the following line
#cd $submitdir
#rm  $tempdir/*
#rmdir $tempdir


echo "Job finished at"
date
################### Job Ended ###################
exit 0