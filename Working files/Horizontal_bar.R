library(dplyr)
df_1<-data.frame(data_cleaned)
pur_year<-group_by(df_1,purpose) %>% summarise(count = n())
sorted1<-pur_year[order(pur_year$count,decreasing = T),]
top5_sorted<-head(sorted1,5)
library(plotly)
purp<-c('debt_consolidation','credit_card','home_improvement','other','major_purchase')
hb<-plot_ly(x=top5_sorted$count,y=purp,type='bar',orientation='h',marker = list(color = 'rgb(128,128,128)', width = 1)) %>% layout(yaxis=a,title = "Total loans taken based on Purpose",xaxis = list(title = "Total loans"),yaxis = list(title = ""),annotations = list(x=top5_sorted$count,y=top5_sorted$purpose,text=top5_sorted$count,font = list(family = 'Arial', size = 18,color = 'rgb(0,0,0)',showarrow = FALSE)))
print(hb)


