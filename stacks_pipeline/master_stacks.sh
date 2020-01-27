### "One ring to rule them all, One ring to find them, One ring to bring them all and in the darkness bind them." 
### Script maestro que correrá los otros 5 scripts

#!/bin/bash

src=$HOME/research/project 

files=”sample_01 
sample_02 
sample_03” 

# Ejecutar script1.sh
source script1.sh

# Ejecutar script2.sh
source script2.sh

# Ejecutar script3.sh
source script3.sh

# Ejecutar script4.sh
source script4.sh

# Ejecutar script5.sh
source script5.sh


