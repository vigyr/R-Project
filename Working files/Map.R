df_3<-data.frame(data_cleaned)
library(dplyr)
library(plotly)
grp3<-group_by(df_3,addr_state) %>% summarise(cnt = n()) 
grp4<-group_by(df_3,addr_state) %>% summarise(Total_amount_approved = sum(loan_amnt))
merged<-merge(grp3,grp4,by="addr_state")
merged_ordr<-merged[with(merged,order(merged[,2], decreasing = T)),]
merged_ordr$lst<-with(merged_ordr,paste(addr_state,"<br>","No of Loans taken:",cnt,"<br>","Total amount approved in this State:",Total_amount_approved))
map<- list(scope = 'usa',projection = list(type = 'albers usa'),showlakes = TRUE,lakecolor = toRGB('white'))
m<-plot_geo(merged_ordr,locationmode='USA-states') %>% add_trace(z=~Total_amount_approved,text=~lst,locations=~addr_state,color=~cnt,colors='Reds') %>% colorbar(title = "Total Loans Taken in Billions",tickprefix = '$') %>% layout(title = 'Total Loans Approved from 2012-2015',geo = map)
print(m)

