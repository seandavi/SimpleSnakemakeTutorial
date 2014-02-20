#!/bin/bash
#
cd $PBS_O_WORKDIR
module load python/3.3.2
snakemake --jobname 's.{jobid}.{rulename}' --js jobscript.sh -k --stats snakemake.stats -T --rerun-incomplete -j 300 --cluster 'qsub {params.batch}'  >&  snakemake.log
