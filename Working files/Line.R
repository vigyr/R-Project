library(zoo)
library(plotly)
united_data<-unite(data_cleaned,CombinedDate, issue_Year, issue_Month, sep="-")
df_unite<-data.frame(united_data)
yearly_grp<-group_by(df_unite,CombinedDate) %>% summarise(count = n())
df_yr<-data.frame(yearly_grp)
Years<-as.yearmon(yearly_grp$CombinedDate,"%y-%b")
df_yr$id<- 1:nrow(df_yr)
df_yr1<-data.frame(Years)
df_yr1$id<-1:nrow(df_yr1)
merged_date<-merge(df_yr,df_yr1,by='id')
sorted<-merged_date[order(merged_date$Years),]
sorted_final<-sorted[,3:4]
library(plotly)
l<-plot_ly(sorted_final,x=~Years,y=~count,type='scatter',mode='lines') %>% layout(title = 'Total loans taken over years', xaxis = list(autotick = F, dtick = 1))
print(l)

