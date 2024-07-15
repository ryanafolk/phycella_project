library(adephylo)
library(phytools)
cp_tree <- read.tree("RAxML_bipartitions.chloroplast_concatenated.accessionsregularized.platenumbers.simplified.tre")

####################
# Load data and match sampling
####################

gps <- read.csv("individual_coordinates.csv")
gps <- na.omit(gps)
row.names(gps) <- gps$Plate.names

library(geiger)
cp_tree.reduced <- treedata(cp_tree, gps)$phy # If Mantel test returns "non-conformable arrays check that taxon sampling matches

####################
# Calculate distance matrices
####################

library(geodist)
geodistances <- geodist_vec(gps$Long, gps$Lat, measure = "geodesic")

cp_distances <- as.matrix(distTips(cp_tree.reduced, tips = gps$Plate.names, method = "patristic", useC = TRUE)) # Give tips explicitly to ensure same order

cp_distances <- cp_distances[gps$Plate.names, gps$Plate.names] # Fix order of labels

####################
# Patristic distances -- geography
####################

library(ape)
mantel.test(geodistances, cp_distances, nperm = 10000)

# Patristic distances chloroplast vs geography, two-sided p = 9.999e-05

nuc_tree <- read.tree("RAxML_bipartitions.nucleusconcatenated.renamed.simplified.tre")
nuc_tree.reduced <- treedata(nuc_tree, gps)$phy # If Mantel test returns "non-conformable arrays check that taxon sampling matches

nuc_distances <- as.matrix(distTips(nuc_tree.reduced, tips = gps$Plate.names, method = "patristic", useC = TRUE)) # Give tips explicitly to ensure same order

nuc_distances <- nuc_distances[gps$Plate.names, gps$Plate.names]

mantel.test(geodistances, nuc_distances, nperm = 10000)

# Patristic distances nuclear vs geography, two-sided p = 0.03769623

####################
# Genetic distances -- geography
####################

cp_genetic_distances <- as.matrix(read.csv("cp_megadistances.platenumbers.csv", check.names = FALSE, row.names = 1))

cp_genetic_distances <- cp_genetic_distances[rownames(cp_genetic_distances)%in%gps$Plate.names,colnames(cp_genetic_distances)%in%gps$Plate.names] # This should guarantee same order

# Populate upper left of matrix to yield symmetric matrix
makeSymm <- function(m) {
   m[upper.tri(m)] <- t(m)[upper.tri(m)]
   return(m)
   }
   
cp_genetic_distances <- makeSymm(cp_genetic_distances)

# Replace NA with 0
cp_genetic_distances[is.na(cp_genetic_distances)] = 0

mantel.test(geodistances, cp_genetic_distances, nperm = 10000)

# Genetic distances chloroplast vs geography, two-sided p = 9.999e-05

nuc_genetic_distances <- as.matrix(read.csv("nuc_megadistances.csv", check.names = FALSE, row.names = 1))

nuc_genetic_distances <- nuc_genetic_distances[rownames(nuc_genetic_distances)%in%gps$Plate.names,colnames(nuc_genetic_distances)%in%gps$Plate.names] # This should guarantee same order

# Populate upper left of matrix to yield symmetric matrix
makeSymm <- function(m) {
   m[upper.tri(m)] <- t(m)[upper.tri(m)]
   return(m)
   }
   
nuc_genetic_distances <- makeSymm(nuc_genetic_distances)

# Replace NA with 0
nuc_genetic_distances[is.na(nuc_genetic_distances)] = 0

mantel.test(geodistances, nuc_genetic_distances, nperm = 10000)

# Genetic distances nucleus vs geography, two-sided p = 0.9644036


####################
# Patristic distances -- morphological data
####################

morphological_distances <- as.matrix(read.csv("morphologicaldistancematrix.csv", check.names = FALSE, row.names = 1))

morphological_distances <- morphological_distances[rownames(morphological_distances)%in%gps$Plate.names,colnames(morphological_distances)%in%gps$Plate.names] # This should guarantee same order

# Populate upper left of matrix to yield symmetric matrix
makeSymm <- function(m) {
   m[upper.tri(m)] <- t(m)[upper.tri(m)]
   return(m)
   }
   
morphological_distances <- makeSymm(morphological_distances)

# Replace NA with 0
morphological_distances[is.na(morphological_distances)] = 0

# Subset all the distance matrices to match sampling (some morphology missing) and redo mantel
cp_distances <- cp_distances[rownames(cp_distances)%in%rownames(morphological_distances),colnames(cp_distances)%in%colnames(morphological_distances)] # This should guarantee same order
mantel.test(morphological_distances, cp_distances, nperm = 10000)
# Patristic distances chloroplast vs morphology, two-sided p = 9.999e-05

nuc_distances <- nuc_distances[rownames(nuc_distances)%in%rownames(morphological_distances),colnames(nuc_distances)%in%colnames(morphological_distances)] # This should guarantee same order
mantel.test(morphological_distances, nuc_distances, nperm = 10000)
# Patristic distances nucleus vs morphology, two-sided p = 9.999e-05

cp_genetic_distances <- cp_genetic_distances[rownames(cp_genetic_distances)%in%rownames(morphological_distances),colnames(cp_genetic_distances)%in%colnames(morphological_distances)] # This should guarantee same order
mantel.test(morphological_distances, cp_genetic_distances, nperm = 10000)
# Genetic distances chloroplast vs morphology, two-sided p = 9.999e-05

nuc_genetic_distances <- nuc_genetic_distances[rownames(nuc_genetic_distances)%in%rownames(morphological_distances),colnames(nuc_genetic_distances)%in%colnames(morphological_distances)] # This should guarantee same order
mantel.test(morphological_distances, nuc_genetic_distances, nperm = 10000)
# Genetic distances nucleus vs morphology, two-sided p = 0.06009399


