# Crea el directorio para guardar datos
mkdir melanerpes

# Bajar las secuencias de cytb de Melanerpes striatus de NCBI
curl -s "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&rettype=fasta&id=17834119,17834115,17834113,2065540,60281185" > melanerpes/melanerpes.fasta

# Contar el número de veces que aparece la secuencia TGCA en las secuencias descargadas
grep "TGCA" melanerpes/melanerpes.fasta | wc -l
