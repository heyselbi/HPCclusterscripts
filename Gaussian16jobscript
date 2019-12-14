# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Script has been written by Rafaella D'auria at UCLA IDRE  #
# and further modified and adjusted by Selbi Nuryyeva       #
# Date: May, 2019                                           #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#!/bin/bash
#$ -cwd
#$ -o $JOB_NAME.joblog.$JOB_ID
#$ -j y
# change user to your username
#$ -M user@mail
#$ -m bea
# specify job needs that you have
#$ -l h_data=MEMREQM,h_rt=TIMEREQ:00:00,arch=intel-[Eg][5o][l-]*,highp
#$ -pe shared NUMCORES

# echo job info on joblog:
echo "Job $JOB_ID started on:   " `hostname -s`
echo "Job $JOB_ID started on:   " `date `
echo " "

# set job environment and GAUSS_SCRDIR variable
. /u/local/Modules/default/init/modules.sh
module load gaussian/g16_avx
export GAUSS_SCRDIR=$TMPDIR
# echo in joblog
module li
echo "GAUSS_SCRDIR=$GAUSS_SCRDIR"
echo " "

echo "/usr/bin/time -v $g16root/g16/g16 < ${JOB_NAME%.*}.com > ${JOB_NAME%.*}.out"
/usr/bin/time -v $g16root/g16/g16 < ${JOB_NAME%.*}.com > ${JOB_NAME%.*}.out

# echo job info on joblog:
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
echo "Input file START:"
cat ${JOB_NAME%.*}.com
echo "END of input file"
echo " "

# Hoffman2 cluster generates these massive core files and sometimes does not delete them
# This ensures that they are cleaned after the job is complete
rm -rf core*
