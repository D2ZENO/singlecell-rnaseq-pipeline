library(Seurat)
source("config.R")
samples <- readRDS(file.path(output_dir, "qc_filtered_samples.rds"))
if (length(samples) > 1 && do_batch_correction) {
  features <- SelectIntegrationFeatures(samples, nfeatures = 3000)
  samples <- PrepSCTIntegration(samples, anchor.features = features)
  anchors <- FindIntegrationAnchors(object.list = samples, normalization.method = "SCT", anchor.features = features)
  combined <- IntegrateData(anchorset = anchors, normalization.method = "SCT")
} else {
  combined <- samples[[1]]
  combined <- SCTransform(combined)
}
combined <- RunPCA(combined) %>%
  FindNeighbors(dims = 1:20) %>%
  FindClusters(resolution = 0.5) %>%
  RunUMAP(dims = 1:20)
DimPlot(combined, label = TRUE)
saveRDS(combined, file = file.path(output_dir, "clustered_object.rds"))
