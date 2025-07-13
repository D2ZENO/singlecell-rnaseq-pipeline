library(Seurat)
library(SeuratDisk)
source("config.R")
obj <- readRDS(file.path(output_dir, "clustered_object.rds"))
if (do_annotation) {
  reference <- LoadReference(reference_file)
  anchors <- FindTransferAnchors(reference = reference, query = obj, normalization.method = "SCT")
  predictions <- TransferData(anchorset = anchors, refdata = reference$celltype)
  obj <- AddMetaData(obj, metadata = predictions)
  DimPlot(obj, group.by = "predicted.id")
  write.csv(obj@meta.data, file.path(output_dir, "cell_annotations.csv"))
  saveRDS(obj, file = file.path(output_dir, "annotated_object.rds"))
}
