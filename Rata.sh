#!/bin/bash
#PBS -N Ratatosk
#PBS -l select=1:ncpus=64:mem=256gb:scratch_local=400gb
#PBS -l walltime=24:00:00
#PBS -M phronek@atlas.cz
#PBS -m abe
#PBS -o /storage/plzen1/home/phronek/Lycorea/Prace/Ratatosk/Rata.stdout
#PBS -e /storage/plzen1/home/phronek/Lycorea/Prace/Ratatosk/Rata.stderr


trap 'clean_scratch' TERM EXIT
cd $SCRATCHDIR || exit 1

cp /storage/plzen1/home/phronek/Lycorea/Prace/concatenated.fastq $SCRATCHDIR/
cp /storage/plzen1/home/phronek/Lycorea/Prace/conc_trimmed_P $SCRATCHDIR/

module load ratatosk-0.1

Ratatosk correct -v -c 63 -i 450 -s conc_trimmed_P -l concatenated.fastq -o Lyco_rata_reads
#Ratatosk correct -2 -v -c 16 -s LcleomM3_short_2.fq -l Lyco_long_reads.2.fastq -o Lyco_long_reads

rm ${SCRATCHDIR}/concatenated.fastq
rm ${SCRATCHDIR}/conc_trimmed_P

cp -r ${SCRATCHDIR}/* /storage/plzen1/home/phronek/Lycorea/Prace/Ratatosk/ || CLEAN_SCRATCH=true


