#***********************************************************************************************************
#***********************************************************************************************************

# Collapsing Data to compute Household size 
#Chris Miyinzi Mwungu
#05/05/2017

#***********************************************************************************************************
#Installing required libraries
#install.packages("plyr")

library(plyr)

#Clearing all objects in the memory
rm(list=ls())  

#Setting working directory
setwd("C:/Users/cmwungu/Desktop/Collapsing Data")  

#Importing the CSV

dataset <- read.csv("data.csv", header = T,sep = ",")

#Collapsing the data 
df <- ddply(dataset,~household_id+gender_id,summarise,count=length(household_id))

#Dropping the duplicates
final_data <- df[!duplicated(paste0(df$household_id)),]

#Saving final dataset in CSV
write.csv(final_data, "final_data.csv",row.names=FALSE)

#***********************************************************************************************************

# End of Code!

#***********************************************************************************************************