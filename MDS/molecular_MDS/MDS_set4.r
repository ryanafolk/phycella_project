# Open alignment in MegaX
# Make sure it's not read as protein
# Make sure - is treated as missing data, not gap
# Calculate pairwise distance matrix
# Make sure to change accession names with the script at this point
# Use pairs of taxa, no variance estimation, maximum composite likelihood, transitions + transversions, uniform rates, homogeneous patterns, pairwise missing data deletion
# Save to csv as lower left matrix

distance = as.matrix(read.csv("case4_distance.csv", check.names = FALSE, row.names = 1))

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

# Row list: "P8_Placea_amoena_P001_WA4", "P8_Placea_amoena_P001_WB4", "P8_Placea_amoena_P001_WC4", "P9_Placea_amoena_P001_WD4", "P9_Placea_amoena_P001_WE4", "P9_Placea_amoena_P001_WF4", "P10_Placea_amoena_P001_WG4", "P10_Placea_amoena_P001_WH4", "P10_Placea_amoena_P001_WA5", "P11_Placea_ornata_P001_WB5", "P11_Placea_ornata_P001_WC5", "P11_Placea_ornata_P001_WD5", "P12_Placea_ornata_P001_WE5", "P12_Placea_ornata_P001_WF5", "P12_Placea_ornata_P001_WG5", "P13_Placea_lutea_P001_WH5", "P13_Placea_lutea_P001_WA6", "P14_Placea_ornata_P001_WB6", "P14_Placea_ornata_P001_WC6", "P14_Placea_ornata_P001_WD6", "P14_Placea_ornata_P001_WE6", "P17_Placea_arzae_P001_WE7", "P17_Placea_arzae_P001_WF7", "P17_Placea_arzae_P001_WG7", "P18_Placea_davidii_P001_WH7", "P18_Placea_davidii_P001_WA8", "P18_Placea_davidii_P001_WB8", "P18_Placea_davidii_P001_WC8", "P18_Placea_davidii_P001_WD8", "P19_Placea_arzae_P001_WE8", "P19_Placea_arzae_P001_WF8", "P19_Placea_arzae_P001_WG8", "P20_Placea_quilapilun_P001_WH8", "P20_Placea_quilapilun_P001_WA9", "P20_Placea_quilapilun_P001_WB9", "P20_Placea_quilapilun_P001_WC9", "P32_Placea_arzae_P002_WE04", "P32_Placea_arzae_P002_WF04", "P33_Placea_ornata_P002_WG04", "P33_Placea_ornata_P002_WH04", "P33_Placea_ornata_P002_WA05", "P35_Placea_lutea_P002_WE05", "P35_Placea_lutea_P002_WF05", "P35_Placea_lutea_P002_WG05"
# convert to color list with a grep pattern like this: [^"]*chilensis[^"]*
# color list based on row list
# amoena blue
# ornata red
# lutea darkgoldenrod1
# arzae chartreuse4
# davidii turquoise
# quilapilun orchid1
cols = c("blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "blue", "red", "red", "red", "red", "red", "red", "darkgoldenrod1", "darkgoldenrod1", "red", "red", "red", "red", "chartreuse4", "chartreuse4", "chartreuse4", "turquoise", "turquoise", "turquoise", "turquoise", "turquoise", "chartreuse4", "chartreuse4", "chartreuse4", "orchid1", "orchid1", "orchid1", "orchid1", "chartreuse4", "chartreuse4", "red", "red", "red", "darkgoldenrod1", "darkgoldenrod1", "darkgoldenrod1")

plot(cmdscale(distance), xlab="Coordinate 1", ylab="Coordinate 2", main="MDS", col = cols, pch = 19)

