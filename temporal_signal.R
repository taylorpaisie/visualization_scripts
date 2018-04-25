setwd("/Users/taylorpaisie/Dropbox (UFL)/cholera/mar_2018/ml_tree/")

library(reshape2)
library(scales)
library(tidyr)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggthemes)
library(stringr)
library(plyr)
library(stats)

temp <- read.table(file = "temporal_signal_022818.txt", sep = '\t', header = TRUE)
head(temp)
attach(temp)


slope <- lm(formula = distance ~ date, data = temp)$coefficients[2]

intercept <- lm(formula = distance ~ date, data = temp)$coefficients[1]

ggplot(temp, aes(x=date, y=distance)) + theme_light() + geom_point() + geom_abline(aes(slope = slope, intercept=intercept, colour = "red")) + 
  xlab("Time") + ylab("Root-to-tip Divergence") + 
  scale_x_continuous(breaks = c(2008,2009,2010,2011,2012,2013,2014,2015,2016,2017)) + 
  scale_y_continuous(position = "left") + 
  theme(axis.title.y = element_text(size=25)) +
  theme(axis.title.x = element_text(size=25)) +
  theme(axis.text.y = element_text(size=15)) +
  theme(axis.text.x = element_text(size=10)) 




