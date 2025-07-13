library(Seurat)
source("config.R")
obj <- readRDS(file.path(output_dir, "clustered_object.rds"))
markers <- FindAllMarkers(obj, only.pos = TRUE)
write.csv(markers, file.path(output_dir, "cluster_markers.csv"))
if (file.exists(metadata_file)) {
  meta <- read.csv(metadata_file, row.names = 1)
  obj <- AddMetaData(obj, metadata = meta)
  de_res <- FindMarkers(obj, group.by = "Condition", ident.1 = "Treated", ident.2 = "Control")
  write.csv(de_res, file.path(output_dir, "DE_Treated_vs_Control.csv"))
}
