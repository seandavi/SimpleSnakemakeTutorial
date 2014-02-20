import config
import glob
import os

SAMPLES = [os.path.basename(fname).split('.')[0] for fname in glob.glob('bam/*.bam')]

include: 'bampost.snk'

rule final: 
    params: batch='-l nodes=1:gpfs'
    input: expand('bam/{sample}.bam.bai',sample=SAMPLES)

rule cleanup:
    message: 'cleaning up so we can do this again!'
    shell: 'rm bam/*.md.bam & rm bam/*.bai'
