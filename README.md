### What is this?

This repository contains a simple set of files for playing with Snakemake on the NIH Biowulf cluster.
```
.
|-- README.md
|-- Snakefile
|-- bam
|   |-- SRR015353.bam
|   |-- SRR015354.bam
|   |-- SRR039129.bam
|   |-- SRR039130.bam
|   |-- SRR039131.bam
|   |-- SRR039132.bam
|   |-- SRR039133.bam
|   |-- SRR039134.bam
|   |-- SRR039135.bam
|   `-- SRR039136.bam
|-- bampost.snk
|-- config.py
|-- jobscript.sh
`-- submit.sh
```

### Example snakemake commands:
Before getting started, you'll need to run:

```
module load python/3.3.2
```

This loads the python/3.3.2 libraries, including the `snakemake` executable.

```
snakemake -n
snakemake -n --printshellcmds
snakemake -n --dag
snakamake -n --forceall --dag | dot -Tsvg > dag.svg
snakemake 
snakemake cleanup
snakemake -j 8
```
