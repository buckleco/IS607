#*****************************
#Code to source the data
#*****************************

#getwd()
#create a data frame of the data from the csv file
ent.df <- read.table(file = "entropy-test-file.csv", header = TRUE, sep = ",")
#head(ent.df)
#tail(ent.df)
#str(ent.df)

#create a vector from each of the columns
#these will be used below when calling the functions
attr1.vec <- as.vector(ent.df[,1])
attr2.vec <- as.vector(ent.df[,2])
attr3.vec <- as.vector(ent.df[,3])
attr4.vec <- as.vector(ent.df[,4])

#*****************************
#Question 1
#*****************************

entropy <- function(ent.input)
{
  #get length the input vector
  k <- length(ent.input)
  #create a vector of input vector element probabilities
  prob.vec <- (table(ent.input)) / k
  #calculate the entropy using the vector of input vector element probabilities   
  -sum(prob.vec*log2(prob.vec))
}
#call the entropy() function
entropy(attr4.vec)
entropy(attr1.vec)
entropy(attr2.vec)
entropy(attr3.vec)

#*****************************
#Question 2
#*****************************

infogain <- function(target.vec, attribute.vec)
{
  #get length the attribute vector
  k <- length(attribute.vec)
  #create a vector of the attribute totals by categorical value))
  att.totals.vec <- as.vector(table(attribute.vec))
  #create a vector of attribute probabilities
  att.probs.vec <- att.totals.vec/k
  #create a table of the probabilities of the attributes and target combinations 
  att.targ.probs.tab <- table(attribute.vec,target.vec)/att.totals.vec
  #create a vector with an NA for each row in the 'att.targ.probs.tab' table  
  ent.vec <- rep(NA, nrow(att.targ.probs.tab))
  #loop through the 'att.targ.probs.tab' table
  #replace each NA in ent.vec with the entropy for the jth value of the attribute
  for(j in 1:nrow(att.targ.probs.tab)){
    ent.vec[j] <- c(-sum(att.targ.probs.tab[j,]*log2(att.targ.probs.tab[j,])))
  }
  #sum the weighted average of the entropy values from the attribute partition 
  partition.entropy <- sum(ent.vec*att.probs.vec)
  #calculate the entropy of the full target vector
  target.entropy <- as.numeric(entropy(target.vec))
  #calculate the info gain 
  target.entropy-partition.entropy
}
#call the infogain() function
infogain(attr4.vec, attr1.vec)
infogain(attr4.vec, attr2.vec)
infogain(attr4.vec, attr3.vec)

#*****************************
#Question 3
#*****************************

decide <- function(df.full, targcol)
{
  #ensure that the target is the last column in the data frame
  df.full <- df.full[, c((1:ncol(df.full))[-targcol], targcol)]
  #create a vector of NAs for the number of attribute columns in the data frame  
  infogain.vec <- rep(NA, (ncol(df.full)-1))
  #populate the vector using infogain function and inherit the attribute names
  for(j in 1:ncol(df.full)){
    if (j!=tarcol){
      infogain.vec[j] <- infogain(df.full[,targcol], df.full[,j])
      names(infogain.vec)[j] <- names(df.full)[j]
    }
  }
  #create a named list to return:
  #1)the index of the max info gain
  #2)the vector of all info gains
  retList <- list("max" = match(max(infogain.vec),infogain.vec), "gains" = infogain.vec)
  retList
}
#call the decide() function
decide(ent.df,4)