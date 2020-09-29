# Metagenomica

### Este repositorio contiene un script para analizar secuencias de ITS2 (hongos) generados por Illumina MiSeqde a partir de nuestras de suelo rizosférico recolectados en sitios de bosque nativo (N) y mixto (M) de Quercus (Q) y de Juniperus (J). El análisis a realizar con el programa AMPtk incluye el clustering (padding), filtrado y asignacíon taxonómica de los OTUs de acuerdo la base de datos de secuencias de [UNITE] (https://unite.ut.ee/).
### El directorio _bin_ contiene el script pata correr AMPtk con RUTAS RELATIVAS para analizar los datos de Illumina MiSeq que están en el cluster, en la carpeta de metagenomica/fasq. El directorio _data_ contiene el archivo taxonomy.biom generado con el script anteriormente mencionado. 
### Con el cambio del parámetro de ***min_lenght*** de 300 bp (clase) a 200 (tarea), se obtuvo un mayor número de taxa (de 215 a 1257) y de muestras (de 7 a 12).
