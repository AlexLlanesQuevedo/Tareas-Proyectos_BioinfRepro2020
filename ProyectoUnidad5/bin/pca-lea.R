### Load packages
library(SNPRelate)
library(ape)
library(ggplot2)

##### SNPRelate
## Make gds format from plink
snpgdsBED2GDS("../data/lobos_en_plink.bed", 
              "../data/lobos_en_plink.fam", 
              "../data/lobos_en_plink.bim", 
              out.gdsfn="../data/lobos_gds.gds", 
              option = snpgdsOption(Z=39)) # 39 chromosomes

# Load gds file
genofile <- snpgdsOpen("../data/lobos_gds.gds")

# PCA
pca <- snpgdsPCA(genofile)

# Calculate the variation retained by the first components
pc.percent <- pca$varprop*100
head(round(pc.percent, 2))
x<-round(pc.percent, 2)
sum(x[1:4])
sum(x[1:10])
sum(x[1:30])

# Write the results to a df
tab <- data.frame(sample.id = pca$sample.id,
                  EV1 = pca$eigenvect[,1],    # the first eigenvector
                  EV2 = pca$eigenvect[,2],    # the second eigenvector
                  stringsAsFactors = FALSE)
head(tab)

# Plot
ggplot(data = tab, aes(x=EV2, y=EV1)) + geom_point() +
  ylab(paste0("eigenvector 1 explaining ", round(pc.percent, 2)[1], "%")) +
  xlab(paste0("eigenvector 2 explaining ", round(pc.percent, 2)[2], "%"))

### Install LEA
# install.packages(c("fields","RColorBrewer","mapplots"))
# source("http://bioconductor.org/biocLite.R")
# biocLite("LEA")

## Load LEA
library(LEA)

## convert vcf to geno
vcf2geno("../data/lobos.vcf", output.file = "../data/lobos.vcf.geno", force = TRUE)

## Inference of individual admixture coefficients using snmf
obj.at = snmf("../data/lobos.vcf.geno", K = 1:5, ploidy = 2, entropy = T, CPU = 2, repetitions = 10, project = "new")

## Choose the number of clusters
plot(obj.at, col = "blue4", cex = 1.4, pch = 19)

## Plot admixure coefficients
my.colors <- c("steelblue","tomato4","orange","springgreen", "red")
barchart(obj.at, K = 5, run = 4,
         border = NA, space = 0,
         col = my.colors,
         xlab = "Individuals",
         ylab = "Admixture coefficients",
         main = "") -> bp

