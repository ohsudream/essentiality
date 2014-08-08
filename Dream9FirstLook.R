#Playing with DREAM 9 gene essentiality prediction data
# pwew pwew pwew

CopyTrain <- read.table("CCLE_copynumber_training.gct", skip=2, header=T,
                        sep="\t")
CopyTrain[1:10,1:5]

ExpTrain <- read.table("CCLE_expression_training.gct", skip=2, header=T,
                       sep="\t")
ExpTrain[1:10,1:5]

?read.table
