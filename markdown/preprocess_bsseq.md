<br><br>
# Info on preprocessing WGBS Data

Here is the preprocessing script:

```
/apps/lab/aryee/preprocess_bsseq.sh 
```

Usage notes:
```
# Usage:
#   preprocess_bsseq.sh [SAMPLE_NAME] [R1_FASTQ] [R2_FASTQ]
# Example:
#   ./preprocess_bsseq.sh mysample tmp/tmp_r1.fastq tmp/tmp_r2.fastq
#
# [SAMPLE_NAME] (e.g. mysample above) is used to name the output files. 
# For example, the primary output file is named [SAMPLE_NAME].bw
#
# Note: If using a cluster request 32GB RAM and 4 cores. E.g. on LSF:
#   bsub -q big -M 32000 -R 'rusage[mem=32000]' -n 4 preprocess_bsseq.sh [SAMPLE_NAME] [R1_FASTQ] [R2_FASTQ]
```
<br><br>