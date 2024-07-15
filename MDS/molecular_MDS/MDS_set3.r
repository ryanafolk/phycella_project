# Open alignment in MegaX
# Make sure it's not read as protein
# Make sure - is treated as missing data, not gap
# Calculate pairwise distance matrix
# Make sure to change accession names with the script at this point
# Use pairs of taxa, no variance estimation, maximum composite likelihood, transitions + transversions, uniform rates, homogeneous patterns, pairwise missing data deletion
# Save to csv as lower left matrix

distance = as.matrix(read.csv("case3_distance.csv", check.names = FALSE, row.names = 1))

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

# Row list: "P1_Phycella_cyrtanthoides_P001_WA1", "P1_Phycella_cyrtanthoides_P001_WB1", "P1_Phycella_cyrtanthoides_P001_WC1", "P3_Phycella_cyrtanthoides_P001_WG1", "P3_Phycella_cyrtanthoides_P001_WH1", "P3_Phycella_cyrtanthoides_P001_WA2", "P4_Phycella_cyrtanthoides_P001_WB2", "P4_Phycella_cyrtanthoides_P001_WC2", "P4_Phycella_cyrtanthoides_P001_WD2", "P4_Phycella_cyrtanthoides_P001_WE2", "P4_Phycella_cyrtanthoides_P001_WF2", "P5_Phycella_cyrtanthoides_P001_WG2", "P5_Phycella_cyrtanthoides_P001_WH2", "P6_Phycella_scarlatina_P001_WA3", "P6_Phycella_scarlatina_P001_WB3", "P6_Phycella_scarlatina_P001_WC3", "P6_Phycella_scarlatina_P001_WD3", "P6_Phycella_scarlatina_P001_WE3", "P15_Phycella_angustifolia_P001_WF6", "P15_Phycella_angustifolia_P001_WG6", "P15_Phycella_angustifolia_P001_WH6", "P15_Phycella_angustifolia_P001_WA7", "P16_Phycella_cyrtanthoides_P001_WB7", "P16_Phycella_cyrtanthoides_P001_WC7", "P16_Phycella_cyrtanthoides_P001_WD7", "P21_Phycella_cyrtanthoides_P002_WA01", "P21_Phycella_cyrtanthoides_P002_WB01", "P21_Phycella_cyrtanthoides_P002_WC01", "P27_Phycella_cyrtanthoides_P002_WH02", "P27_Phycella_cyrtanthoides_P002_WA03", "P27_Phycella_cyrtanthoides_P002_WB03", "P31_Phycella_angustifolia_P002_WB04", "P31_Phycella_angustifolia_P002_WC04", "P31_Phycella_angustifolia_P002_WD04", "P34_Phycella_scarlatina_P002_WB05", "P34_Phycella_scarlatina_P002_WC05", "P34_Phycella_scarlatina_P002_WD05"
# convert to color list with a grep pattern like this: [^"]*chilensis[^"]*
# color list based on row list
# cyrtanthoides blue
# scarlatina red
# angustifolia chartreuse4
cols = c("blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "red", "red", "red", "red", "red", "chartreuse4", "chartreuse4", "chartreuse4", "chartreuse4", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "chartreuse4", "chartreuse4", "chartreuse4", "red", "red", "red")

plot(cmdscale(distance), xlab="Coordinate 1", ylab="Coordinate 2", main="MDS", col = cols, pch = 19)

