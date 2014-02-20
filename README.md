### Getting started. 

This repository contains a simple set of files for playing with Snakemake on the NIH Biowulf cluster.  Clone this repository into a convenient place in your data directory:

```
git clone https://github.com/seandavi/SimpleSnakemakeTutorial.git
```

This will create a directory called `SimpleSnakemakeTutorial` that contains:

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
Before working with snakemake, you will need to run:

```
module load python/3.3.2
```

This loads the python/3.3.2 libraries, including the `snakemake` executable.  Note that this will also change the python executable to be python version 3.3.2.  To change back, do `module unload python/3.3.2`.

See the [snakemake documentation](https://bitbucket.org/johanneskoester/snakemake/wiki/Home) for more details, but a few quick commands can get you started.

```
snakemake -n
snakemake --summary
snakemake -n --printshellcmds
snakemake -n --dag
snakamake -n --forceall --dag | dot -Tsvg > dag.svg
snakemake 
snakemake cleanup
snakemake -j 8
...
snakemake cleanup
qsub -l nodes=1:gpfs submit.sh
```


