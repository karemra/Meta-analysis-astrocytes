Overview
This repository contains the code, data processing scripts, and statistical analysis for a meta-analysis focused on astrocyte transcriptomic responses 
The goal of this project is to synthesize data from multiple studies to identify consistent patterns in astrocyte reactivity

# RNA-seq: a step-by-step analysis pipeline.

- Data Acquisition:

        - Galaxy-Workflow-Download_and_Extract_Reads_in_FASTQ.ga : Automates the retrieval and extraction of raw .fastq files from GEO and EBI databases.

- Initial Quality Control:

        - Galaxy-Workflow-FastQC.ga: Performs initial quality analysis using FASTQC v0.12.1 to detect adapters and overrepresented reads.

- Preprocessing & Cleaning:

        - Galaxy-Workflow-TrimmomaticPE.ga: Filters low-quality reads and trims adapters via Trimmomatic v0.39.

        - Galaxy-Workflow-SortMeRNA_rRNA_filtering_paired_end.ga : Removes ribosomal RNAs (rRNAs) using SortMeRNA v4.3.6 against rRNA, Rfam, and SILVA databases.

- Mapping & Quantification:

        - Galaxy-Workflow-STAR_alignment.ga: Aligns non-ribosomal reads to the GENCODE (GRCh38 v44) reference genome using STAR v2.7.10b.

        - Galaxy-Workflow-htseqcount.ga: Quantifies gene-level counts from mapped reads via the HTSeq-count package.

- Statistical Analysis:

        - Galaxy-Workflow-Limma.ga: Conducts differential expression analysis using the Limma-Voom package.

        - Robust.R: A supplementary R script used for robustness checks and additional statistical validation.
