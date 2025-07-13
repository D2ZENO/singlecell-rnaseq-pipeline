# 🔬 Single-Cell RNA-seq Analysis Pipeline (R-based)

This repository contains a fully modular and scalable pipeline to analyze single-cell RNA sequencing (scRNA-seq) data using RStudio. Built primarily using **Seurat**, **Monocle 3**, and **Azimuth**, it supports any tissue, species, or cell type and is designed for automation and reproducibility.

## 🚀 Features

- ✅ Works with human, mouse, and any species
- ✅ QC, normalization, dimensionality reduction, clustering
- ✅ Differential expression across clusters or conditions
- ✅ Pseudotime inference (Monocle 3)
- ✅ Cell type annotation (Azimuth / SingleR)
- ✅ Batch-mode support
- ✅ User-friendly configuration in `config.R`

## 📁 Folder Structure

```
singlecell-rnaseq-pipeline/
├── scripts/           # Modular R scripts (QC, clustering, DE, etc.)
├── data/              # Input 10X or .h5 data
├── metadata/          # Sample or condition metadata
├── references/        # Cell-type reference maps (Azimuth or SingleR)
├── results/           # Outputs: UMAPs, DEGs, pseudotime, .rds
├── config.R           # Main configuration script
├── .gitignore         # Ignore temp/large files in GitHub
└── README.md          # Documentation
```

## ⚙️ Requirements

```r
install.packages(c("Seurat", "tidyverse"))
devtools::install_github("satijalab/seurat-wrappers")
BiocManager::install(c("monocle3", "SingleR", "SummarizedExperiment"))
```

## 🧬 How to Run

1. Add your 10X or .h5 data to `data/`
2. (Optional) Add `sample_metadata.csv` to `metadata/`
3. Download Azimuth/SingleR reference and save to `references/`
4. Configure `config.R`
5. Run:
```r
source("scripts/00_run_all.R")
```

## 📜 License

MIT License — see [LICENSE](LICENSE)

Made with ❤️ by Debarghya Dutta
