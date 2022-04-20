################################################################################
# 
### Q.Matrix: 
# For extracting Q matrices representing the ancestry proportions/assignment 
# probabilities from standard STRUCTURE outputs after running on the command 
# line. 
#
#-------------------------------------------------------------------------------
#
## Usage: 
# Q.Matrix(file, k, extraCols)
#
#-------------------------------------------------------------------------------
# 
## Input:
#file - path to f file outputted by command line STRUCTURE run
# k - the number of k selected for STRUCTURE run
# extraCols - a character vector of names of any extra/nonstandard columns such 
# those containing location information.
#
--------------------------------------------------------------------------------
#
## Output:
# A data frame containing the sample ID column, columns corresponding to each k,
# and the extra columns, respectively.
#
#_______________________________________________________________________________
#
# Garrett J. Behrends (04/2022)
################################################################################





Q.Matrix <- function(file, k, extraCols) {
  
  require(readr)
  
  Q <- read_lines(file)
  Q <- grep("\\(.\\)", Q, value = T)
  excess <- paste0(unlist(c("NA", ":", "\\(.\\)")), collapse = "|")
  spaces <- paste0(unlist(c("    ", "   ", "  ", " ")), collapse = "|")
  Q <- gsub(spaces, replacement = "\t", Q)
  Q <- read.table(text = Q, sep = "\t")
  Q <- Q[-grep(excess, Q)] 
  remove(spaces)
  remove(excess)
  
  if (missing(extraCols)) {
    print("No extra column names specified...")
    if (ncol(Q) - (k + 1) > 0) {
      s <- (ncol(Q) - (k + 1))
      Q <- Q[c(1, ((ncol(Q) - k) + 1):ncol(Q), 2:(ncol(Q) - k))]
      colnames(Q) <- c("Sample", paste0("K", rep(1:k)), paste0(seq(1:s)))
      return(Q)
    }
    else {
      Q <- Q[c(3, (ncol(Q) - k):(ncol(Q)-1))]
      colnames(Q) <- c("Sample", paste0("K", rep(1:k)))
      return(Q)
    }
  }
    else {
      s <- (ncol(Q) - (k + 1))
      Q <- Q[c(1, ((ncol(Q) - k) + 1):ncol(Q), 2:(ncol(Q) - k))]
      colnames(Q) <- c("Sample", paste0("K", rep(1:k)), paste0(extraCols))
      return(Q)
    }
}
