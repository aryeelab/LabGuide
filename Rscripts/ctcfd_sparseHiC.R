library(sparseHiC)
library(BiocParallel)

samples <- c("auxin_rep1", "auxin_rep2", "untreated_rep1", "untreated_rep2", "washoff_rep1", "washoff_rep2")
    
# Vector of name of samples; will produce 1 object/name here
for(s in samples){
  base <- "/data/aryee/caleb/ctcf_depletion/data/hicpro_output/hic_results/matrix"
  
  resolutions <- c("20000", "40000", "150000", "500000", "1000000")
  # matrix.files <- paste0(base, "/", s, "/raw/", resolutions, "/", s, "_", resolutions, ".matrix")  # Raw, obviously
  matrix.files <- paste0(base, "/", s, "/iced/", resolutions, "/", s, "_", resolutions, "_iced.matrix") # Iced
  bed.files <- paste0(base, "/", s, "/raw/", resolutions, "/", s, "_", resolutions, "_abs.bed")
  
  HiCPro2DNAlandscapeR(matrix.files = matrix.files, bed.files = bed.files, resolutions = resolutions,
                       sampleName = s, genomeBuild = "mm9", splitByChr = TRUE, BPPARAM = SerialParam())
}
