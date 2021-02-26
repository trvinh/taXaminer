#!/bin/bash


#Python packages
#standard library includes: itertools + sys

pip install biopython # numpy + Bio.Seq
pip install scipy
pip install pyyaml


#R packages

Rscript -e 'install.packages("factoextra", repos="https://cloud.r-project.org",quiet=TRUE)'
Rscript -e 'install.packages("plotly", repos="https://cloud.r-project.org",quiet=TRUE)'
Rscript -e 'install.packages("paran", repos="https://cloud.r-project.org",quiet=TRUE)'
Rscript -e 'install.packages("mclust", repos="https://cloud.r-project.org",quiet=TRUE)'
Rscript -e 'install.packages("dbscan", repos="https://cloud.r-project.org",quiet=TRUE)'
Rscript -e 'install.packages("BiocManager", repos="https://cloud.r-project.org",quiet=TRUE)'
Rscript -e 'BiocManager::install("PhyloProfile")'

# make MILTS script executable
chmod +x MILTS.sh
chmod +x test.sh
[[ ! -d tools ]] && mkdir -p tools
cd tools

#samtools

wget https://github.com/samtools/samtools/releases/download/1.11/samtools-1.11.tar.bz2
tar xjf samtools-1.11.tar.bz2
cd samtools-1.11/
./configure --prefix=$PWD
make
make install

cd ..

#bedtools

wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools.static.binary
mv bedtools.static.binary bedtools
chmod a+x bedtools



#Diamond

wget http://github.com/bbuchfink/diamond/releases/download/v2.0.7/diamond-linux64.tar.gz
tar xzf diamond-linux64.tar.gz


#gffread

wget https://github.com/gpertea/gffread/releases/download/v0.12.1/gffread-0.12.1.Linux_x86_64.tar.gz
tar xzf gffread-0.12.1.Linux_x86_64.tar.gz
mv gffread-0.12.1.Linux_x86_64 gffread-0.12.1



rm -rf samtools-1.11.tar.bz2 gffread-0.12.1.Linux_x86_64.tar.gz diamond-linux64.tar.gz

#Database

#wget https://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/nr.gz
#wget https://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdump.tar.gz
#wget https://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/prot.accession2taxid.gz

#tar -zxf 'taxdump.tar.gz' nodes.dmp names.dmp
#diamond makedb --in "nr.gz" -d "nr_taxonomy.dmnd" --taxonmap "prot.accession2taxid.gz" --taxonnodes "nodes.dmp" --taxonnames "names.dmp"
#rm -rf nr.gz prot.accession2taxid.gz nodes.dmp names.dmp taxdump.tar.gz

cd ..