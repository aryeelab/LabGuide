# Running Hi-C Pro on rgs13
```
module load aryee/hicpro-2.7.6 
```
It's installed:
```
/apps/lab/aryee/HiC-Pro_2.7.6
```


## Example from IMR90 Rao et al. 
```
cd /PHShome/ma695/work/projects/gbm_topology
HiC-Pro  -i input/rao/fastq -o output/hicpro/rao_imr90 -c config-hicpro-mboi-ext12.txt -p
cd output/hicpro/rao_imr90
# Remove parameter-less bsub options (e.g. "-N") HiCPro_step1_hicpro.sh, HiCPro_step2_hicpro.sh  
bsub < HiCPro_step1_hic.sh 
# Wait for jobs to finish
bsub < HiCPro_step2_hic.sh
```

Configuration file found [here](https://raw.githubusercontent.com/aryeelab/LabGuide/master/data/config-human-mboi-ext12.txt)
