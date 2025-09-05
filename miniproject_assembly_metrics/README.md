# Mini_Project 1: Calculating Assembly Metrics for C. remanei
Instructions, background information, and results for use in Mini-Project 1...should hopefully make reproducability easier :D

C. remanei genome 248909
- https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA248909/caenorhabditis_remanei.PRJNA248909.WBPS19.genomic.fa.gz
    - size_once_unzipped = 115M
    - Number_of_contigs: 1591  Total_length: 118549266 Average_length: 74512.42363293526

C. remanei genome 248911
- https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA248911/caenorhabditis_remanei.PRJNA248911.WBPS19.genomic.fa.gz
    - size_once_unzipped = 121M
    - Number_of_contigs: 912  Total_length: 124541912 Average_length: 136559.11403508772

C. remanei genome 53967
- https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA53967/caenorhabditis_remanei.PRJNA53967.WBPS19.genomic.fa.gz
    - size_once_unzipped = 141M
    - Number_of_contigs: 3670  Total_length: 145442736 Average_length: 39630.17329700272

C. remanei genome 577507
- https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA577507/caenorhabditis_remanei.PRJNA577507.WBPS19.genomic.fa.gz 
    - size_once_unzipped = 127M
    - Number_of_contigs: 187  Total_length: 130480874 Average_length: 697758.6844919786


How to use assembly_metrics.py script to print Number of contigs, Total length, and Average length for each C. remanei genome -->
- in terminal, convert python script to executable format using command: chmod +x assembly_metrics.py
- run script in terminal using following command, including fasta genome file of interest as second command line argument: 
./assembly_metrics.py caenorhabditis_remanei.PRJNA248909.WBPS19.genomic.fa (example fasta, would change for each worm genome; using C. remanei genome 248909 here)
- would recieve output string: Number of contigs 1591	 Total length 118549266	 Average lenght 74512.42363293526 (numbers change based on inputted fasta; using C. remanei genome 248909 here)
- results of this script for each genome listed above, organized by genome #