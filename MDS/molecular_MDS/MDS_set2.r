# Open alignment in MegaX
# Make sure it's not read as protein
# Make sure - is treated as missing data, not gap
# Calculate pairwise distance matrix
# Make sure to change accession names with the script at this point
# Use pairs of taxa, no variance estimation, maximum composite likelihood, transitions + transversions, uniform rates, homogeneous patterns, pairwise missing data deletion
# Save to csv as lower left matrix

distance = as.matrix(read.csv("case2_distance.csv", check.names = FALSE, row.names = 1))

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

# Colored plot 

# Row list: "P2_Phycella_cyrtanthoides_P001_WD1", "P2_Phycella_cyrtanthoides_P001_WE1", "P2_Phycella_cyrtanthoides_P001_WF1", "P7_Phycella_cyrtanthoides_P001_WF3", "P7_Phycella_cyrtanthoides_P001_WG3", "P7_Phycella_cyrtanthoides_P001_WH3", "P22_Phycella_cyrtanthoides_P002_WD01", "P22_Phycella_cyrtanthoides_P002_WE01", "P23_Phycella_cyrtanthoides_P002_WF01", "P23_Phycella_cyrtanthoides_P002_WG01", "P24_Phycella_cyrtanthoides_P002_WH01", "P24_Phycella_cyrtanthoides_P002_WA02", "P24_Phycella_cyrtanthoides_P002_WB02", "P25_Phycella_cyrtanthoides_P002_WC02", "P25_Phycella_cyrtanthoides_P002_WD02", "P26_Phycella_cyrtanthoides_P002_WE02", "P26_Phycella_cyrtanthoides_P002_WF02", "P26_Phycella_cyrtanthoides_P002_WG02", "P29_Phycella_cyrtanthoides_P002_WE03", "P29_Phycella_cyrtanthoides_P002_WF03", "P30_Phycella_cyrtanthoides_P002_WG03", "P30_Phycella_cyrtanthoides_P002_WH03", "P30_Phycella_cyrtanthoides_P002_WA04", 
# convert to color list with a grep pattern like this: [^"]*chilensis[^"]*
# color list based on row list
# cyrtanthoides blue
cols = c("blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue")

plot(cmdscale(distance), xlab="Coordinate 1", ylab="Coordinate 2", main="MDS", col = cols, pch = 19)

