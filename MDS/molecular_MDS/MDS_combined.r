# Open alignment in MegaX
# Make sure it's not read as protein
# Make sure - is treated as missing data, not gap
# Calculate pairwise distance matrix
# Make sure to change accession names with the script at this point
# Use pairs of taxa, no variance estimation, maximum composite likelihood, transitions + transversions, uniform rates, homogeneous patterns, pairwise missing data deletion
# Save to csv as lower left matrix

distance = as.matrix(read.csv("alltaxa_distance.csv", check.names = FALSE, row.names = 1))

# Populate upper left of matrix to yield symmetric matrix
makeSymm <- function(m) {
   m[upper.tri(m)] <- t(m)[upper.tri(m)]
   return(m)
   }
   
distance <- makeSymm(distance)

# Replace NA with 0
distance[is.na(distance)] = 0

# Text-labeled plot
plot(cmdscale(distance), xlab="Coordinate 1", ylab="Coordinate 2", main="MDS")
text(cmdscale(distance), labels = row.names(distance), cex=.5, pos=3)

# Colored plot -- define colors by regex (make sure there are no nested matches in species names or change patterns accordingly
names <- row.names(distance)
names <- gsub(".*cyrtanthoides.*", "blue", names)
names <- gsub(".*amoena.*", "turquoise", names)
names <- gsub(".*ornata.*", "olivedrab1", names)
names <- gsub(".*lutea.*", "darkgoldenrod1", names)
names <- gsub(".*scarlatina.*", "red", names)
names <- gsub(".*davidii.*", "hotpink", names)
names <- gsub(".*chilensis.*", "darkorchid3", names)
names <- gsub(".*quilapilun.*", "steelblue1", names)
names <- gsub(".*australis.*", "plum", names)
names <- gsub(".*fulgens.*", "salmon", names)
names <- gsub(".*maulensis.*", "forestgreen", names)
names <- gsub(".*angustifolia.*", "darkorange1", names)
names <- gsub(".*arzae.*", "royalblue1", names)

plot(cmdscale(distance), xlab="Coordinate 1", ylab="Coordinate 2", main="MDS", col = names, pch = 19)

# reduced taxa plot

subset <- as.matrix(dist_subset(distance, c(grep(".*maulensis.*", colnames(distance), value = TRUE), grep(".*angustifolia.*", colnames(distance), value = TRUE), grep(".*scarlatina.*", colnames(distance), value = TRUE), grep(".*lutea.*", colnames(distance), value = TRUE), grep(".*angustifolia.*", colnames(distance), value = TRUE), grep(".*chilensis.*", colnames(distance), value = TRUE), grep(".*arzae.*", colnames(distance), value = TRUE), grep(".*australis.*", colnames(distance), value = TRUE), grep(".*fulgens.*", colnames(distance), value = TRUE), grep(".*davidii.*", colnames(distance), value = TRUE))))

names <- row.names(subset)
names <- gsub(".*amoena.*", "turquoise", names)
names <- gsub(".*ornata.*", "olivedrab1", names)
names <- gsub(".*lutea.*", "darkgoldenrod1", names)
names <- gsub(".*scarlatina.*", "red", names)
names <- gsub(".*davidii.*", "hotpink", names)
names <- gsub(".*chilensis.*", "darkorchid3", names)
names <- gsub(".*quilapilun.*", "steelblue1", names)
names <- gsub(".*australis.*", "plum", names)
names <- gsub(".*fulgens.*", "salmon", names)
names <- gsub(".*maulensis.*", "forestgreen", names)
names <- gsub(".*angustifolia.*", "darkorange1", names)
names <- gsub(".*arzae.*", "royalblue1", names)

# Color plot
plot(cmdscale(subset), xlab="Coordinate 1", ylab="Coordinate 2", main="MDS", col = names, pch = 19)

# Text-labeled plot
plot(cmdscale(distance), xlab="Coordinate 1", ylab="Coordinate 2", main="MDS")
text(cmdscale(distance), labels = row.names(distance), cex=.5, pos=3)

