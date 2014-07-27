#!/usr/bin/env R
oldNames=as.character(system("ls ../*gct",intern=TRUE))
trim <- function(filename) {substr(filename,4,nchar(filename))}
newNames <- as.character (lapply(oldNames,trim))
pairedNames <- data.frame(oldNames,newNames)
for (i in 1:nrow(pairedNames)) {
  assign(as.character(pairedNames$newNames[i]),
         read.table(as.character(pairedNames$oldNames[i]),
                        sep="\t", header=TRUE, skip=2))
}

