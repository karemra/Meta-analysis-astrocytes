install.packages("RobustRankAggreg")
library(RobustRankAggreg)

meta1<- read.delim("MatrizDOWN.txt",na="")

#Convert the data to a suitable format. RobustRankAggreg package needs the input to be 
#in the format of list,

meta<- as.list(meta1)

##To get rid of the “not available” positions in the list, we use custom helper function:
for (i in 1: length(meta)){ 
  
  meta[[i]] <- meta[[i]] [!is.na(meta[[i]])]  
  
  meta[[i]] <- as.character(meta[[i]]) 
  
}  

##Add information about the number of gene counts profiled in each study.

count <- c(61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228,61228) 

#count <- c(1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976,1976) 

##Construct the matrix of normalized ranks using rankMatrix command:
## The argument N is used to define the number of miRNAs each study was able to profile (previously defined vector count)
rankmat <- rankMatrix(meta, N = count) 

##Run RRA analysis using the “aggregateRanks” command to obtain a significance score

ranks<- aggregateRanks(rmat=rankmat)  

##Apply a multiple testing correction. Conservative Bonferroni correction is used by multiplying 
## all the ρ-scores with the maximal number of genes detected by any study

ranks$adjustedPval <-  apply(cbind(ranks$Score 
                                   
                                   * max(count), 1), 1, min) 

##Filter the results by significance, This command allows you to construct the new data
##frame results, which consists of data about only those miRNAs with adjusted p-value < 0.05

results <- ranks[ranks$adjustedPval < 0.05,] 

##Export the results table out of R with the following command
write.table(results, "results_down.txt", sep = "\t") 

