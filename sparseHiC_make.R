library(sparseHiC)
library(BiocParallel)

samples <- c("BT142-rep1")  # Vector of name of samples; will produce 1 object/name here
for(s in samples){
  base <- "/PHShome/ma695/work/projects/gbm_topology/output/hicpro/johnstone_gbm_mincisdist1000/hic_results/matrix"
  
  resolutions <- c("20000", "40000", "150000", "500000", "1000000")
  matrix.files <- paste0(base, "/", s, "/iced/", resolutions, "/", s, "_", resolutions, ".matrix")  #change iced to raw if so desired
  bed.files <- paste0(base, "/", s, "/raw/", resolutions, "/", s, "_", resolutions, "_abs.bed")
  
  HiCPro2DNAlandscapeR(matrix.files = matrix.files, bed.files = bed.files, resolutions = resolutions,
                       sampleName = s, genomeBuild = "hg19", splitByChr = TRUE, BPPARAM = SerialParam())
}
