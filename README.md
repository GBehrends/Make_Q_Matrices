# Make_Q_Matrices
An R function for extracting Q matrices from STRUCTURE outputs after runs on the command line.

STRUCTURE (Pritchard et al. 2000) is a popular software for inference of population structure. Its output on the command line contains a Q matrix which represents the ancestry proportions or ancestry assignment probabilities for individuals to k population clusters. The Q matrix is contained within a .txt-like f file where it is not easily available to do plotting with via R. The Q.Matrix function extracts that Q matrix and puts it into a data frame so that it can easily be visualized using R. 

Citation:
Pritchard, J. K., Stephens, M., & Donnelly, P. (2000). Inference of Population Structure Using Multilocus Genotype Data. Genetics, 155(2), 945–959. https://doi.org/10.1093/genetics/155.2.945
