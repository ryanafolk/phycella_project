# phycella_project
 
## main_text_figures
Preparatory files for main text Figures 2 and 3.

## species_delimitation
Directory containing all BPP and iBPP analyses. In the main directory the file `bpp_ibpp_summary_cleaned.xlsx` gives a summary of the run results contained in the subdirectories. Columns are the "cases" representing subsampled analyses and replicates (see below) and rows are number of species. The values in the cells are posterior probabilities, which are color coded by magnitude to aid in reading. The different tabs represent the different analyses, also described below.

Subdirectories indicate (first level) the method type (BPP or iBPP), (second level) taxon dropping treatment, and (third level) taxon subsample ("case") and replicate number. The taxon drop treatments in iBPP either involve full molecular sampling, treating missing trait data as missing data ("fullmolecular_traitmissing") or with no missing data ("matched"). There are four replicates per method per taxon dropping treatment per taxon subsample. In certain iBPP runs not all replicates converged at the default number of generations, and in these cases additional replicates were run with more generations, indicated by "_moregenerations." These can be recognized in the summary excel file by analyses with posterior probability 1 at or near the starting parameters ("stuck" runs).

## MDS
Files for molecular and morphological multidimensional scaling analyses (MDS). Subdirectories are:

### molecular_MDS
In the main directory, r scripts give the analysis with all taxa (`MDS_combined.r`) and subset analyses following the BPP taxon subsets (`MDS_set1.r`, `MDS_set2.r`, `MDS_set3.r`, and `MDS_set4.r`), with corresponding CSVs giving the distance matrices for each MDS. Plots from these R scripts are given in the `plots` directory and input molecular data are given in the `alignments` directory.

### morphological_MDS
There are two subdirectories with the same missing data treatment as iBPP (missing data kept or removed). In each analysis, the input trait data are in `phycella_trait.py`, the analysis script to generate the distance matrix is `phycella_trait.py`, the distance matrix is `distancematrix.csv`, the MDS script is `pcoa_traitdata.r`, and R plots are in the subdirectory `plots`.

## mantel
This directory gives the data and code for Mantel tests. The analysis script is `mantel_tests.r`. CSVs give coordinates and distance matrices, tree files give the trees used for deriving patristic distances, and `rename.sh` is a script for reconciling names from the different datasets.

## phylogenetics
This directory gives trees and alignments for phylogenetic analyses. The subdirectories are:

### ASTRAL_chloroplast
The gene trees are in `all_gene_trees.bs10collapsed.tre` and allele tables for population and species trees are in `allele_table_populations_cp.txt` and `allele_table_cp.txt` respectively. Three tree results are given for each of individual-, population-, and species-level analyses.

### ASTRAL_nuclear
The gene trees are in `all_genes.bs10collapsed.tre` and allele tables for population and species trees are in `allele_table_populations.txt` and `allele_table.txt` respectively. The results are given in the tree files. There is one tree each for the individual-, population-, and species-level analyses using plate and well codes, and a second set of trees with species names and population codes ("renamed").

### chloroplast_alignments
A complete list of alignments used in the chloroplast analyses. Exons and introns are marked as such. Alignments that contain two gene names separated by underscores (e.g., `ndhB-trnL_IRa.phy`) are spacer regions. The general region of the chloroplast is also marked in the names ("IRa", "LSC", "SSC").

### concatenated_chloroplast
This directory contains the chloroplast concatenated analysis files. The full list of best trees and bootstrap trees are contains in `besttree` and `bootstrap subdirectories` respectively. The `combined` subdirectory contains the best-scoring tree with mapped bootstrap values.

### concatenated_nuclear
This directory contains the nuclear concatenated analysis files. The full list of best trees and bootstrap trees are contains in `besttree` and `bootstrap subdirectories` respectively. The `combined` subdirectory contains the best-scoring tree with mapped bootstrap values.

## rename_script
This directory contains a general-use script relating plate and well names to taxa and population codes; versions of this script are given in some directories where modifications were necessary.
