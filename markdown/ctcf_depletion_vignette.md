<br><br>
# GEO -> sparseHiC

A vignette for getting data off of GEO's online repository and processing it into
sparseHiC data objects. 

### Get .fastqs from GEO



### Set up a folder hierarchy

You'll want to put each sample in its own folder within `fastq` and then all `.fastq`
files corresponding to the sample should be placed inside accordingly. 

When pulling the data from the SRA run selector for this experiment, the following table
served as a guide for linking samples to the specific SRA files.

```
SRR5633682	SAMN07180887	GSM2644945	untreated_rep1
SRR5633683	SAMN07180887	GSM2644945	untreated_rep1
SRR5633684	SAMN07180890	GSM2644946	untreated_rep2
SRR5633685	SAMN07180890	GSM2644946	untreated_rep2
SRR5633686	SAMN07180889	GSM2644947	auxin_rep1
SRR5633687	SAMN07180889	GSM2644947	auxin_rep1
SRR5633688	SAMN07180889	GSM2644947	auxin_rep1
SRR5633689	SAMN07180889	GSM2644947	auxin_rep1
SRR5633690	SAMN07180888	GSM2644948	auxin_rep2
SRR5633691	SAMN07180891	GSM2644949	washoff_rep1
SRR5633692	SAMN07180891	GSM2644949	washoff_rep1
SRR5633693	SAMN07180892	GSM2644950	washoff_rep2
SRR5633694	SAMN07180892	GSM2644950	washoff_rep2
```

Thus, I created 6 folders and placed the dumped `.fastq` files in their corresponding
positions--

```
[cl322@rgs13 fastq]$ ls -lrtR
.:
total 384
drwxrws---. 2 cl322 aryee 4096 Jun 25 00:06 untreated_rep1
drwxrws---. 2 cl322 aryee 4096 Jun 25 00:06 untreated_rep2
drwxrws---. 2 cl322 aryee 4096 Jun 25 00:07 auxin_rep1
drwxrws---. 2 cl322 aryee 4096 Jun 25 00:07 auxin_rep2
drwxrws---. 2 cl322 aryee 4096 Jun 25 00:07 washoff_rep1
drwxrws---. 2 cl322 aryee 4096 Jun 25 00:07 washoff_rep2

./untreated_rep1:
total 67125584
-rw-rw----. 1 cl322 aryee  6738081211 Jun 24 13:48 SRR5633682_1.fastq.gz
-rw-rw----. 1 cl322 aryee  6743742913 Jun 24 13:48 SRR5633682_2.fastq.gz
-rw-rw----. 1 cl322 aryee 20978647182 Jun 24 18:40 SRR5633683_1.fastq.gz
-rw-rw----. 1 cl322 aryee 21749521589 Jun 24 18:40 SRR5633683_2.fastq.gz

./untreated_rep2:
total 59744320
-rw-rw----. 1 cl322 aryee  4154352666 Jun 24 13:34 SRR5633684_1.fastq.gz
-rw-rw----. 1 cl322 aryee  4162196492 Jun 24 13:34 SRR5633684_2.fastq.gz
-rw-rw----. 1 cl322 aryee 20640964411 Jun 24 18:53 SRR5633685_1.fastq.gz
-rw-rw----. 1 cl322 aryee 21071363292 Jun 24 18:53 SRR5633685_2.fastq.gz

./auxin_rep1:
total 148773136
-rw-rw----. 1 cl322 aryee  7697086442 Jun 24 14:33 SRR5633686_1.fastq.gz
-rw-rw----. 1 cl322 aryee  7706428024 Jun 24 14:33 SRR5633686_2.fastq.gz
-rw-rw----. 1 cl322 aryee 14585258776 Jun 24 16:20 SRR5633687_1.fastq.gz
-rw-rw----. 1 cl322 aryee 14599886681 Jun 24 16:20 SRR5633687_2.fastq.gz
-rw-rw----. 1 cl322 aryee 18487445604 Jun 24 19:01 SRR5633689_1.fastq.gz
-rw-rw----. 1 cl322 aryee 18469764905 Jun 24 19:01 SRR5633689_2.fastq.gz
-rw-rw----. 1 cl322 aryee 21158353397 Jun 24 19:38 SRR5633688_1.fastq.gz
-rw-rw----. 1 cl322 aryee 21876348599 Jun 24 19:38 SRR5633688_2.fastq.gz

./auxin_rep2:
total 12549472
-rw-rw----. 1 cl322 aryee 5257643446 Jun 24 14:37 SRR5633690_1.fastq.gz
-rw-rw----. 1 cl322 aryee 5250859720 Jun 24 14:37 SRR5633690_2.fastq.gz

./washoff_rep1:
total 67530800
-rw-rw----. 1 cl322 aryee  6912788980 Jun 24 15:00 SRR5633691_1.fastq.gz
-rw-rw----. 1 cl322 aryee  6922405461 Jun 24 15:00 SRR5633691_2.fastq.gz
-rw-rw----. 1 cl322 aryee 20952266880 Jun 24 19:59 SRR5633692_1.fastq.gz
-rw-rw----. 1 cl322 aryee 21761815924 Jun 24 19:59 SRR5633692_2.fastq.gz

./washoff_rep2:
total 56139104
-rw-rw----. 1 cl322 aryee  3169465096 Jun 24 14:31 SRR5633693_1.fastq.gz
-rw-rw----. 1 cl322 aryee  3165191338 Jun 24 14:31 SRR5633693_2.fastq.gz
-rw-rw----. 1 cl322 aryee 19800233127 Jun 24 19:54 SRR5633694_1.fastq.gz
-rw-rw----. 1 cl322 aryee 20874814000 Jun 24 19:54 SRR5633694_2.fastq.gz
```

Once the data is in place, we can set up HiC-Pro. 

### Configuring HiC-Pro

The folder with the annotation files for `HiC-Pro 2.7.6` is here. If you need a new
restriction enzyme digestion, genome build, etc., there are R scripts present to make
such annotation files. 

```
/apps/lab/aryee/HiC-Pro_2.7.6/annotation
```

The big things that you want to ensure are correct are that you 1) have the right organism / genome build
and 2) you have the correct restriction enzyme for digestion. The configuration file that I used for this
round of processing [can be found here](../data/config-mouse-hindiii-ext12.txt), which was the `mm9`
genome build + HindIII restriction enzyme cutter. 

### Running HiC-Pro

This is mostly duplicated from the [HiC-Pro](hicpro.md) page, but here are the specific 
commands that were run. 

```
cd /data/aryee/caleb/ctcf_depletion/data
 HiC-Pro -i fastq/ -c config-mouse-hindiii-ext12.txt -o hicpro_output -p
cd hicpro_output
# Remove parameter-less bsub options (e.g. "-N") HiCPro_step1_hicpro.sh, HiCPro_step2_hicpro.sh  
bsub < HiCPro_step1_hic.sh 
# Wait for jobs to finish; in this case > 24 hrs
bsub < HiCPro_step2_hic.sh
# Finishes in about 24 hours
```

### HiC-Pro -> sparseHiC

The last step isn't as turn-key as the others, but it's still relatively straight forward.  
Basically all you have to do is run [this Rscript](../Rscripts/ctcfd_sparseHiC.R). You know, 
just `bsub -q big Rscript ctcfd_sparseHiC.R` (it is parallelizable if you know what you're doing
with `sparseHiC` according to my notes, but since I forgot how to make it work, I wouldn't 
recommend it). Anyways, here are a few notes on running:

- It will create one `.tgz` file per sample in the current working directory. 
- Run the script from two different directories at the same time to get both
iced and raw simultaneously. 
- Once can interchangeably comment lines 11 and 12 to get either raw or iced output. 
- Line 13 must be left as is (even though it points to raw for the `.bed` file. This
is HiC-Pro convention, and the `.bed` files are the same anyways so don't worry about it. 

**Contact**: [Caleb](mailto:caleblareau@g.harvard.edu) with questions.

<br><br>