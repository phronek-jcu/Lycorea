#!/bin/bash
#Input=$1
#Path=${PWD}
#Kmer=$3

#TimeStamp=$(date +"%Y%m%d.%H%M")
#BaseName="$(basename "${Input}" $2)"
#Count=${BaseName}.jf
#Histo=${BaseName}.histo
#NewDir=${Path}/${BaseName}_Jellyfish_${TimeStamp}
#mkdir=${NewDir}
#OutFile=${NewDir}/${BaseName}_Jellyfish.pbs

#(
#cat << EndOfJobScript

#PBS -N Jellyfish
#PBS -l select=1:ncpus=16:mem=1024gb:scratch_local=600gb
#PBS -l walltime=16:00:00
#PBS -M phronek@atlas.cz
#PBS -m abe
#PBS -o /storage/plzen1/home/phronek/Lycorea/Prace/Jellyfish.stdout
#PBS -e /storage/plzen1/home/phronek/Lycorea/Prace/Jellyfish.stderr

trap 'clean_scratch' TERM EXIT
cd $SCRATCHDIR || exit 1

cp /storage/plzen1/home/phronek/Lycorea/Prace/concatenated.fastq $SCRATCHDIR/

module load jellyfish-2.3.0

jellyfish count -m 21 -C -s 200M -t 10 concatenated.fastq

#NanoPlot -t 7 --outdir $SCRATCHDIR/ --prefix Data_concatenated --N50 --format png --fastq $SCRATCHDIR/concatenated.fastq

rm ${SCRATCHDIR}/concatenated.fastq

cp -r ${SCRATCHDIR}/* /storage/plzen1/home/phronek/Lycorea/Prace/Jellyfish_Data_01_10_2021/ || CLEAN_SCRATCH=true
#module load jellyfish-2.3.0

#trap 'clean_scratch' TERM EXIT

#cp ${Input} \$SCRATCHDIR || exit 1

#cd \$SCRATCHDIR || exit 2

#zcat $(basename ${Input}) | /software/jellyfish/2.3.0/bin jellyfish count -C -m 21 -s 10G -t 16 ${Count} /dev/fd/0

#wait /software/jellyfish/2.3.0/bin/jellyfish histo -t 16 ${Count} > ${Histo}

#cp -r \$SCRATCHDIR/* ${NewDIr}/ || export CLEAN_SCRATCH=false

#EndOfJobScript

#) > ${OutFile}

#chmod +x ${OutFile}

#qsub ${OutFile}

#cd ..



