library(reshape2)
library(scales)
library(tidyr)
library(dplyr)
library(ggplot2)

#my data
df = data.frame("Year" = seq(2010,2017,by = 1), "Ogawa" = c(27, 14, 26,	195,	18,	14,	60,	7), "Inaba" = c(0,	0,	1,	2,	0,	9,	112, 103))

dfm = melt(df, id.vars = "Year")

samp_plot <- ggplot(dfm,aes(x = Year, y = value,fill = variable)) + theme_light() +
  geom_bar(position = "fill",stat = "identity") + scale_y_continuous(labels = percent_format()) +
  scale_x_continuous(breaks = 2010:2017,labels= as.character(seq(2010,2017,by = 1))) + ggtitle("Ogawa and Inaba Isolates Collected") +
  theme(plot.title = element_text(hjust = 0.5, size = 30), 
        legend.title = element_text(vjust = 1, size = 20), legend.text = element_text(size = 15), 
        axis.title.x=element_text(vjust = 1, size = 25), axis.text.x = element_text(size = 20), 
        axis.title.y=element_text(vjust = 1, size = 25), axis.text.y = element_text(size = 20)) +
  scale_fill_manual(name = "Serotype", labels = c("Ogawa", "Inaba"), values=c("cyan3", "darkorange1")) 

print(samp_plot + labs(y = "Percent", x = "Year"))
