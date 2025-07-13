library(Seurat)
library(tidyverse)
source("config.R")
sample_files <- list.files(input_dir, full.names = TRUE)
all_samples <- list()
for (file in sample_files) {
  data <- Read10X(data.dir = file)
  obj <- CreateSeuratObject(counts = data, project = basename(file))
  mt_pattern <- ifelse(species == "human", "^MT-", "^mt-")
  obj[["percent.mt"]] <- PercentageFeatureSet(obj, pattern = mt_pattern)
  obj <- subset(obj, subset = nFeature_RNA > 200 & percent.mt < 5)
  all_samples[[basename(file)]] <- obj
}
saveRDS(all_samples, file = file.path(output_dir, "qc_filtered_samples.rds"))
