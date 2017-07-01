<br><br>
# Access data files from GEO

To access .fastq files from GEO quickly and efficiently, use `aspera`
to get the SRA files and then `fastq-dump` to generate the .fastq files. 
[Here's a shell script](https://raw.githubusercontent.com/aryeelab/LabGuide/master/shell/aspera.lsf)
that is designed to do just this efficiently and quickly
given a list of SRRs that are desired.

## Recommended Usage
Run this on a node to facilitate the downloading and each `fastq-dump` command will run
on its own node. 

```
bsub -q long sh aspera.lsf SRRs.txt
```

For example, this `SRRs.txt` file when viewed--
```
>cl322@rgs13 data]$ cat SRRs.txt 
```
produces
```
SRR5633682
SRR5633683
SRR5633684
SRR5633685
SRR5633686
SRR5633687
SRR5633688
SRR5633689
SRR5633690
SRR5633691
SRR5633692
SRR5633693
SRR5633694
```
<br><br>