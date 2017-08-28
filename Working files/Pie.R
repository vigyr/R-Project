library(dplyr)
library(plotly)
ho_ow<-group_by(data_cleaned,home_ownership) %>% summarise(count =n())
df_5<-data.frame(ho_ow)
ordr_df5<-df_5[with(df_5,order(df_5[,2], decreasing = T)),]
top_df5<-head(ordr_df5,3)
pie<-plot_ly(top_df5,labels=top_df5$home_ownership,values=top_df5$count,type='pie',textposition = 'inside',textinfo = 'label+percent',insidetextfont = list(color = '#FFFFFF'),pull = list(color = '#FFFFFF', width = 3))
p<-layout(pie,title = 'Percentage Distribution of People Applying Loan Based on Home Ownership', xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE), yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
print(p)