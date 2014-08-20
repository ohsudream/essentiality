#!/usr/bin/env R

nocfg <- function() {
  example.filename = "ohsudream-config-example.R"
  fh <- file(example.filename,"r")
  nocfg.msg <- readChar(fh,file.info(example.filename)$size)
  nocfg.msg <- paste("Please create a local config file that defines some local values, e.g:\n=========\n",nocfg.msg,sep="")
  close(fh)
  stop(nocfg.msg)
}

tryCatch(source("ohsudream-config.R"),error = function(e) nocfg())

#setwd(dream.wd)

trimlength = nchar(dream.data.files.directory) + 2 # the dot and the slash add 2 more
system.cmd = paste(dream.ls," ",dream.data.files.directory,"/*.gct",sep="")
#print (system.cmd)

oldNames=as.character(system(system.cmd,intern=TRUE))
trim <- function(filename) {substr(filename,trimlength,nchar(filename))}



newNames <- as.character (lapply(oldNames,trim))
pairedNames <- data.frame(oldNames,newNames)
for (i in 1:nrow(pairedNames)) {
  assign(as.character(pairedNames$newNames[i]),
         read.table(as.character(pairedNames$oldNames[i]),
                        sep="\t", header=TRUE, skip=2))
}

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
