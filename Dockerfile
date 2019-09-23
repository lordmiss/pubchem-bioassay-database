FROM bioconductor/release_base2:latest
MAINTAINER Tyler Backman <tyler.backman@email.ucr.edu>
RUN printf "if (!requireNamespace(\"BiocManager\", quietly = TRUE))\n    install.packages(\"BiocManager\")\nBiocManager::install()\nBiocManager::install(c(\"ape\", \"devtools\"))\ndevtools::install_github(\"TylerBackman/bioassayR\")\n" | R --slave
RUN apt-get update && apt-get install -y hmmer
ADD . /pubchem-bioassay-database
RUN cd /pubchem-bioassay-database && make working/summarystats.txt
