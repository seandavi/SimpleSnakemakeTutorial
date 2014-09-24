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
module load graphviz
snakamake -n --forceall --dag | dot -Tsvg > dag.svg
snakemake 
snakemake cleanup
snakemake -j 8
snakemake cleanup
qsub -l nodes=1:gpfs submit.sh
```

### Running Snakemake on Biowulf

After you have checked out this git repository (or downloaded it and unpacked it), to run snakemake on the Biowulf cluster, there are three options:

  - Interactively login to a node and run snakemake interactively on that node (no cluster backend)
  - Interactively login to a node and run snakemake interactively, but with cluster submission of jobs
  - Batch submit snakemake

#### Running interactively on a single node

This is a good place to start with small snakemake workflows or to do testing.

```
qsub -I -l nodes=1:XXXXXXX
```
Substitute into the code above for XXXXXX the node characteristics you would like to use (g24, c24, etc.)  Once you have an interactive node, run snakemake as on a desktop, etc.

```
module load python/3.3.2
snakemake -j
```

The `-j` tells snakemake to use all available cores on the node. 

#### Running interactively on a single node with cluster submission of jobs

Once the jobs become longer and more complicated, running on a single node will not suffice.  Instead, we can instruct snakemake to submit each job to its own node.  Do as for running interactively on a single node (login to a dedicated node).  After doing so, modify the `snakemake -j` by adding `--js jobscript.sh -k -j 300 --cluster 'qsub {params.batch}'.  This will start snakemake, but jobs will be submitted to the cluster (each job on a node) rather than being run directly on the node of interest.

#### Batch submit snakemake

To submit the entire snakemake workflow as a batch job (no interactive node required), simply use:

```
qsub -l nodes=1 submit.sh
```
