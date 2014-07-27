# This script reads in the training data and subsets the names of genes
# into those included in the solution file (Those for which we are supposed
# to predict essentiality scores - Achilles_v2.9_training.gct), those which
# overlap with the expression and copy number data, and those for which all
# data is available.
# The gene names themselves, from the Description field, are written to text files
# and the data frame is then subsetted (someone verify that this part works?)

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
