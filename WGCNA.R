# Use WGCNA to create networks
# Run subsetting.R first
# Load WGCNA package
#source("http://bioconductor.org/biocLite.R") 
#biocLite("impute") 
#install.packages("WGCNA")

library(WGCNA)

express.matrix<-express.of.all[,2:47]
copynum.matrix<-copynum.of.all[,2:47]
essentiality.matrix<-essentiality.of.all[,2:47]

express.tree = flashClust(dist(express.matrix), method = "average")
copynum.tree = flashClust(dist(copynum.matrix), method = "average")
essentiality.tree = flashClust(dist(essentiality.matrix), method = "average")

#Create a paired list of gene numbers and their heights in the dendogram
#express.list <- express.tree[2:3]
#Query the list by gene number
express.tree$height[which(express.tree$order==1967)]
express.matrix$Description[which(rownames(express.matrix)=="1967")]

#Save images of heirarchical cluster dendogrames
png(filename="~/GitHub/essentiality/DREAM/expresscluster.png")
plot(express.tree, main = "Gene clustering based on expression", sub="", xlab="",cex.lab = 1.5,cex.axis = 1.5, cex.main = 2)
dev.off()

png(filename="~/GitHub/essentiality/DREAM/copynumcluster.png")
plot(copynum.tree, main = "Gene clustering based on expression", sub="", xlab="",cex.lab = 1.5,cex.axis = 1.5, cex.main = 2)
dev.off()

png(filename="~/GitHub/essentiality/DREAM/essentialcluster.png")
plot(essentiality.tree, main = "Gene clustering based on expression", sub="", xlab="",cex.lab = 1.5,cex.axis = 1.5, cex.main = 2)
dev.off()
