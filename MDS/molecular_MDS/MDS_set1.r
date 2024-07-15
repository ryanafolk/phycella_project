# Open alignment in MegaX
# Make sure it's not read as protein
# Make sure - is treated as missing data, not gap
# Calculate pairwise distance matrix
# Make sure to change accession names with the script at this point
# Use pairs of taxa, no variance estimation, maximum composite likelihood, transitions + transversions, uniform rates, homogeneous patterns, pairwise missing data deletion
# Save to csv as lower left matrix

distance = as.matrix(read.csv("case1_distance.csv", check.names = FALSE, row.names = 1))

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

# Row list: "P28_Phycella_Phycella_chilensis_P002_WC03", "P28_Phycella_chilensis_P002_WD03", "P36_Phycella_australis_P002_WH05", "P36_Phycella_australis_P002_WA06", "P36_Phycella_australis_P002_WB06", "P37_Phycella_australis_P002_WC06", "P37_Phycella_australis_P002_WD06", "P38_Phycella_chilensis_P002_WE06", "P38_Phycella_chilensis_P002_WF06", "P39_Phycella_australis_P002_WG06", "P39_Phycella_australis_P002_WH06", "P39_Phycella_australis_P002_WA07", "P40_Phycella_australis_P002_WB07", "P40_Phycella_australis_P002_WC07", "P40_Phycella_australis_P002_WD07", "P41_Phycella_chilensis_P002_WE07", "P41_Phycella_chilensis_P002_WF07", "P41_Phycella_chilensis_P002_WG07", "P42_Phycella_chilensis_P002_WH07", "P42_Phycella_chilensis_P002_WA08", "P43_Phycella_chilensis_P002_WB08", "P43_Phycella_chilensis_P002_WC08", "P43_Phycella_chilensis_P002_WD08", "P44_Phycella_chilensis_P002_WE08", "P44_Phycella_chilensis_P002_WF08", "P45_fulgens_P002_WG08", "P45_fulgens_P002_WH08", "P45_fulgens_P002_WA09", "P46_Phycella_maulensis_P002_WB09", "P46_Phycella_maulensis_P002_WC09", "P46_Phycella_maulensis_P002_WD09", "P47_Phycella_maulensis_P002_WE09", "P47_Phycella_maulensis_P002_WF09", 
# convert to color list with a grep pattern like this: [^"]*chilensis[^"]*
# color list based on row list
# chilensis blue
# australis turquoise
# fulgens chartreuse4
# maulensis orchid1
cols = c("blue", "blue", "turquoise", "turquoise", "turquoise", "turquoise", "turquoise", "blue", "blue", "turquoise", "turquoise", "turquoise", "turquoise", "turquoise", "turquoise", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "chartreuse4", "chartreuse4", "chartreuse4", "orchid1", "orchid1", "orchid1", "orchid1", "orchid1")

plot(cmdscale(distance), xlab="Coordinate 1", ylab="Coordinate 2", main="MDS", col = cols, pch = 19)

