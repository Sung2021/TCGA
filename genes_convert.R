library(org.Hs.eg.db)
library(clusterProfiler)
## input geneID is ENSEMBL
## output : SYMBOL
## input : human

genes <- read.csv('../rds/tmp/rsem.csv', header = F)
genes %>% head()
geneset <- substr(genes$V1,1,15)
genes_to_convert <- bitr(geneset, fromType = 'ENSEMBL', 
                         toType = "SYMBOL", OrgDb = "org.Hs.eg.db")
genes_to_convert %>% head()
genes_to_convert %>% dim()
write.csv(genes_to_convert,'../rds/tmp/genes_converted.csv')
