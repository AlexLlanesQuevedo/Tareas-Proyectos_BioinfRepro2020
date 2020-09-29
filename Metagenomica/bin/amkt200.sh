### ensamblar los reads forward y reverse y eliminar los primers y secuencias cortas
amptk illumina -i ../../metagenomica/fastq -o amptk/ -f GTGARTCATCRARTYTTTG -r CCTSCSCTTANTDATATGC -l 300 --min_len 200 --full_length --cleanup

### filtro de calidad
amptk cluster -i amptk.demux.fq.gz -o cluster -m 2 --uchime_ref ITS

### Filtering the OTU table
amptk filter -i cluster.otu_table.txt -o filter -f cluster.cluster.otus.fa -p 0.005 --min_reads_otu 2

### asignar la taxonomía de los OTUs
amptk taxonomy -i filter.final.txt -o taxonomy200 -f filter.filtered.otus.fa -m ../../metagenomica/amptk.mapping_file.txt -d ITS2 --tax_filter Fungi

