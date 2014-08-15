#!/usr/bin/env R
<<<<<<< HEAD
<<<<<<< HEAD
setwd("~")
setwd("Desktop/DREAM/essentiality") # FIXME - need to read this from a config file

oldNames=as.character(system("ls DREAM/*.gct",intern=TRUE))
trim <- function(filename) {substr(filename,7,nchar(filename))}
=======
oldNames=as.character(system("ls *gct",intern=TRUE))
trim <- function(filename) {substr(filename,0,nchar(filename))}
>>>>>>> 2b9ae6c1c0aa692f44e6bcef8f85e37b71a37045
=======
oldNames=as.character(system("ls *gct",intern=TRUE))
trim <- function(filename) {substr(filename,0,nchar(filename))}
>>>>>>> 2b9ae6c1c0aa692f44e6bcef8f85e37b71a37045
newNames <- as.character (lapply(oldNames,trim))
pairedNames <- data.frame(oldNames,newNames)
for (i in 1:nrow(pairedNames)) {
  assign(as.character(pairedNames$newNames[i]),
         read.table(as.character(pairedNames$oldNames[i]),
                        sep="\t", header=TRUE, skip=2))
}

<<<<<<< HEAD
<<<<<<< HEAD
sds <- lapply(Achilles_v2.9_training.gct[1:14557,3:47],sd)
df<-data.frame(list(Name=NA,Description=NA),sds)
row.names(df) <- "Standard Dev"
Achilles_v2.9_training.gct.withsds <- rbind(df,Achilles_v2.9_training.gct)
Achilles_v2.9_training.gct.sortedByStdev <- Achilles_v2.9_training.gct.withsds[, order(Achilles_v2.9_training.gct.withsds[which(rownames(Achilles_v2.9_training.gct.withsds) == 'Standard Dev'), ]) ]


sds <- apply(Achilles_v2.9_training.gct[3:47],1,sd)
genes <- Achilles_v2.9_training.gct[,1:2]
Achilles_v2.9_training.gct.sds.by.gene <- cbind(genes,sds)
#Achilles_v2.9_training.gct.sds.by.gene.sorted <- 
#  Achilles_v2.9_training.gct.sds.by.gene[order(Achilles_v2.9_training.gct.sds.by.gene$sds),]

means <- apply(Achilles_v2.9_training.gct[3:47],1,mean)
medians <- apply(Achilles_v2.9_training.gct[3:47],1,median)
Achilles_v2.9_training.gct.sds.by.gene <- cbind(Achilles_v2.9_training.gct.sds.by.gene,means,medians)
Achilles_v2.9_training.gct.sds.by.gene.sorted <- 
  Achilles_v2.9_training.gct.sds.by.gene[order(Achilles_v2.9_training.gct.sds.by.gene$sds),]
=======
>>>>>>> 2b9ae6c1c0aa692f44e6bcef8f85e37b71a37045
=======
>>>>>>> 2b9ae6c1c0aa692f44e6bcef8f85e37b71a37045
