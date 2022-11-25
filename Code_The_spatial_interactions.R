###############################################################################à###
# Author: Enrico Lucci
# Paper: The spatial interactions between remains within extensive dwelling spaces
# Date: 25/11/2022
###################################################################################

#libraries
library(spatstat)
library(foreach)
library(ggplot2)

#to organise plotted outcomes in a grid
par(mfrow <- c(2,4)) 
#use the function "foreach" for sub-setting from categories list  
#n is the total number of elements composing the categories list
foreach(a = 1:n) %:% #sub-set in loop the position "a"
  foreach(b = 1:n) %do% { #sub-set in loop the position "b"
    A <- Categories[a] #A is the first element of the analysed pair combination
    #a -> is a numeric value to subset an element from
    #     the Categories list 
    B <- Categories[b] #B is the second element of the analysed pair combination
    #b -> a numeric value previously set by the function foreach
    if(a != b) { #exclude the possibility A = B
      G1= Gcross(remains,A,B) #Cross G function of the pair combination
      plot(G1, main = NULL, legend = FALSE)} #charting result
  }
