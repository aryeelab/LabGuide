<br><br>
# GEO -> sparseHiC


### Configuring HiC-Pro

The folder with the annotation files for `HiC-Pro 2.7.6` is here. If you need a new
restriction enzyme digestion, genome build, etc., there are R scripts present to make
such annotation files. 

```
/apps/lab/aryee/HiC-Pro_2.7.6/annotation
```

### Running HiC-Pro

```
cd /data/aryee/caleb/ctcf_depletion/data
 HiC-Pro -i fastq/ -c config-mouse-mboi-ext12.txt -o hicpro_output -p
cd output/hicpro/rao_imr90
# Remove parameter-less bsub options (e.g. "-N") HiCPro_step1_hicpro.sh, HiCPro_step2_hicpro.sh  
bsub < HiCPro_step1_hic.sh 
# Wait for jobs to finish
bsub < HiCPro_step2_hic.sh
```

<br><br>