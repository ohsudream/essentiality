# This script reads in the training data and subsets the names of genes
<<<<<<< HEAD
# into those included in the essentiality file (Those for which we are supposed
=======
# into those included in the solution file (Those for which we are supposed
>>>>>>> 2b9ae6c1c0aa692f44e6bcef8f85e37b71a37045
# to predict essentiality scores - Achilles_v2.9_training.gct), those which
# overlap with the expression and copy number data, and those for which all
# data is available.
# The gene names themselves, from the Description field, are written to text files
# and the data frame is then subsetted (someone verify that this part works?)

<<<<<<< HEAD
expressfile <- "~/GitHub/essentiality/DREAM/CCLE_expression_training.gct"
copynumfile <- "~/GitHub/essentiality/DREAM/CCLE_copynumber_training.gct"
essentialfile <- "~/GitHub/essentiality/DREAM/Achilles_v2.9_training.gct"

express <- read.delim(expressfile, skip=2, header=TRUE, stringsAsFactors=FALSE)
copynum <- read.delim(copynumfile, skip=2, header=TRUE, stringsAsFactors=FALSE)
essentiality <- read.delim(essentialfile, skip=2, header=TRUE, stringsAsFactors=FALSE)

# check boxplot of expression and copy number
# These look pretty normalized
boxplot(express[,3:47])
boxplot(copynum[,3:47])

# deal with NaN genes in expression set (298 of these)
express <- express[which(express$Description!="NaN"),]

ex.desc <- express$Description
cn.desc <- copynum$Description
# All the genes in the essentiality file
so.desc <- essentiality$Description
# Overlap between copynumber and essentiality
cn.so.desc <- intersect(so.desc, cn.desc)
# Overlap between expression and essentiality
ex.so.desc <- intersect(so.desc, ex.desc)
# Genes in all 3 there are 12,951 of them
all.desc <- intersect(ex.so.desc, cn.so.desc)

## For when you need a list of gene names
write.table(so.desc, file="~/GitHub/essentiality/DREAM/essential_genes.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(cn.so.desc, file="~/GitHub/essentiality/DREAM/copynum_genes.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(ex.so.desc, file="~/GitHub/essentiality/DREAM/express_genes.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(all.desc, file="~/GitHub/essentiality/DREAM/all_genes.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)

# Get all the values for these subsets
essentiality.of.copynum <- essentiality[which(intersect(essentiality$Description, cn.so.desc)>0),]
essentiality.of.express <- essentiality[which(intersect(essentiality$Description, ex.so.desc)>0),]
essentiality.of.all <- essentiality[which(intersect(essentiality$Description, all.desc)>0),]

# Futher subset values of expression and copy number arrays
copynum.of.essentiality <- copynum[which(intersect(copynum$Description, cn.so.desc)>0),]
copynum.of.all <- copynum[which(intersect(copynum$Description, all.desc)>0),]

express.of.essentiality <- express[which(intersect(express$Description, ex.so.desc)>0),]
express.of.all <- express[which(intersect(express$Description, all.desc)>0),]
=======
expressfile <- "~/DREAM/CCLE_expression_training.gct"
copynumfile <- "~/DREAM/CCLE_copynumber_training.gct"
solutionfile <- "~/DREAM/Achilles_v2.9_training.gct"

express <- read.delim(expressfile, skip=2, header=TRUE, stringsAsFactors=FALSE)
copynum <- read.delim(copynumfile, skip=2, header=TRUE, stringsAsFactors=FALSE)
solution <- read.delim(solutionfile, skip=2, header=TRUE, stringsAsFactors=FALSE)

ex.desc <- express$Description
cn.desc <- copynum$Description
# All the genes in the solution file
so.desc <- solution$Description
# Overlap between copynumber and solution
cn.so.desc <- intersect(so.desc, cn.desc)
# Overlap between expression and solution
ex.so.desc <- intersect(so.desc, ex.desc)
# Genes in all 3
all.desc <- intersect(ex.so.desc, cn.so.desc)

## For when you need a list of gene names
write.table(so.desc, file="~/DREAM/essential_genes.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(cn.so.desc, file="~/DREAM/copynum_genes.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(ex.so.desc, file="~/DREAM/express_genes.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
write.table(all.desc, file="~/DREAM/all_genes.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)

#Get all the values for these subsets
genes_in_solution <- solution[which(intersect(solution$Description, so.desc)>0),]
genes_in_cn.so <- solution[which(intersect(solution$Description, cn.so.desc)>0),]
genes_in_ex.so <- solution[which(intersect(solution$Description, ex.so.desc)>0),]
genes_in_all <- solution[which(intersect(solution$Description, all.desc)>0),]
>>>>>>> 2b9ae6c1c0aa692f44e6bcef8f85e37b71a37045
