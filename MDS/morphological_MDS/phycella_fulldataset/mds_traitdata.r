distance <- read.csv(file="distancematrix.csv", row.names=1, header = TRUE)

# Text-labeled plot
plot(cmdscale(distance), xlab="Coordinate 1", ylab="Coordinate 2", main="MDS")
text(cmdscale(distance), labels = row.names(distance), cex=.5, pos=3)

# Colored plot -- define colors by regex (make sure there are no nested matches in species names or change patterns accordingly
names <- row.names(distance)


names <- gsub(".*amoena.*", "turquoise", names)
names <- gsub(".*angustifolia.*", "darkorange1", names)
names <- gsub(".*arzae.*", "royalblue1", names)
names <- gsub(".*australis.*", "plum", names)
names <- gsub(".*chilensis.*", "darkorchid3", names)
names <- gsub(".*cyrtanthoides.*", "blue", names)
names <- gsub(".*davidii.*", "hotpink", names)
names <- gsub(".*fulgens.*", "salmon", names)
names <- gsub(".*lutea.*", "darkgoldenrod1", names)
names <- gsub(".*maulensis.*", "forestgreen", names)
names <- gsub(".*ornata.*", "olivedrab1", names)
names <- gsub(".*quilapilun.*", "steelblue1", names)
names <- gsub(".*scarlatina.*", "red", names)









mds = cmdscale(distance, k = 3)
plot(mds[,2] ~ mds[,1], xlab="Coordinate 1", ylab="Coordinate 2", main="MDS", col = names, pch = 19)






trait_mds = phyl.pca(tree, distancematrix)
trait_mds = data.frame(trait_mds$S)

PC1 = trait_mds$PC1
names(PC1) <- row.names(trait_mds)
PC1 = data.frame(PC1)
PC2 = trait_mds$PC2
names(PC2) <- row.names(trait_mds)
PC2 = data.frame(PC2)
PC3 = trait_mds$PC3
names(PC3) <- row.names(trait_mds)
PC3 = data.frame(PC3)
plot(trait_mds$PC1, trait_mds$PC2)
ggplot(trait_mds, aes(PC1,PC2)) + geom_point() + geom_text(aes(label=row.names(trait_mds)))

write.table(trait_mds, file="trait_phylomds.txt", sep = "\t")

