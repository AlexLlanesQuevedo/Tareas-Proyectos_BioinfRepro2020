# count individuals and variants (SNPs) in lobos.vcf file
vcftools --vcf ../data/lobos.vcf


## Calculate the allelic frequency for all individuals and save the result in "mis frecuencias".
vcftools --vcf ../data/lobos.vcf --freq --out  ../data/misfrecuencias


## Sites without missing data
vcftools --vcf ../data/lobos.vcf --max-missing 1


## Calculate the allelic frequency for all individuals but from sites without missing data
## save the result in "sin_missing_data"
vcftools --vcf ../data/lobos.vcf --freq --max-missing 1 --out ../data/sin_missing_data


## Sites with allele in frequency less than <0.05
vcftools --vcf ../data/lobos.vcf --max-maf 0.05


 ## Calculate the individual heterozygosity
vcftools --vcf ../data/lobos.vcf --het


## Calculate the nucleotide diversity by site
vcftools --vcf ../data/lobos.vcf --site-pi


## Calculate the nucleotide diversity by site only for loci in chromosome 3
vcftools --vcf ../data/lobos.vcf --chr chr03 --site-pi



## Filter the sites with alleles in frequency less than <0.05 and create a new file called lobos_maf05.vcf.
vcftools --vcf ../data/lobos.vcf --max-maf 0.05 --recode --out ../data/lobos_maf05.vcf


## Convert the lobos_maf05.vcf file to plink format
vcftools --vcf ../data/lobos_maf05.recode.vcf --plink
