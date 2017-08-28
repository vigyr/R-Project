setwd("F:/R project/R project")
install.packages('tidyr')
library(tidyr)
data12_13<-read.csv("12_13_loan_final.csv",header=T,sep=",")
data_14<-read.csv("14_loan_final.csv",header=T,sep=",")
data_15<-read.csv("15_loan_final.csv",header=T,sep=",")
data12_15<-rbind(data12_13,data_14,data_15)
data_12_15_clean1<-separate(data12_15,issue_d,c("issue_Month","issue_Year"),sep="-")
data_12_15_clean2<-data_12_15_clean1[,1:26]
data_cleaned<-data_12_15_clean2
View(data_cleaned)





