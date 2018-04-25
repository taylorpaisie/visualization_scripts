setwd("/Users/tpaisie/Dropbox (UFL)/cholera/feb_2018/selection/my_hyphy/all_o1/")
setwd("/Users/taylorpaisie/Dropbox (UFL)/cholera/feb_2018/selection/my_hyphy/all_o1/")


library(reshape2)
library(scales)
library(tidyr)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggthemes)
library(stringr)
library(plyr)

bb <- read.csv(file = "bb_divergence_021418.csv", sep = ",", header = TRUE)

bb %>% names()
bb %>% head()

#=========================================================
# CHANGE COLUMN NAMES: lower case
# - in the raw form (as read in) the first letter of 
#   each variable is capitalized. 
# - This makes them harder to type!  Not ideal.
# - we'll use stringr::str_to_lower() to change the column
#   names to lower case 
#=========================================================
colnames(bb) <- colnames(bb) %>% str_to_lower()
head(bb)
tail(bb)

dnds <- data.frame(bb)
#dnds <- melt(bb, id = "realtime")
dnds <- mutate(dnds, realtime = -realtime + 2017.94)

head(dnds)
tail(dnds)
attach(dnds)

ggplot(dnds, aes(x=realtime, ymin=dn.min, ymax=dn.max)) + theme_light() + 
  geom_ribbon(aes(x=realtime, ymin=dn.min, ymax=dn.max), alpha=0.5, fill="deeppink") + 
  geom_line(aes(x=realtime, y=dn.divergence), colour="deeppink", size=1.5) + 
  geom_ribbon(aes(x=realtime, ymin=ds.min, ymax=ds.max), alpha=0.5, fill="tan3") + 
  geom_line(aes(x=realtime, y=ds.divergence), colour="tan3", size=1.5) + 
  xlab("Time") + ylab("BB Divergence") + 
  scale_x_continuous(breaks = c(2010,2011,2012,2013,2014,2015,2016,2017)) + 
  scale_y_continuous(position = "right") + 
  theme(axis.title.y = element_text(size=25)) +
  theme(axis.title.x = element_text(size=25)) +
  theme(axis.text.y = element_text(size=15)) +
  theme(axis.text.x = element_text(size=15)) 

int <- read.csv(file = "all_o1_int_divergence.csv", sep = ",", header = TRUE)

int %>% names()
int %>% head()

colnames(int) <- colnames(int) %>% str_to_lower()
head(int)
tail(int)

dnds <- data.frame(int)
dnds <- mutate(dnds, realtime = -realtime + 2017.94)
head(dnds)
tail(dnds)
attach(dnds)

ggplot(dnds, aes(x=realtime, ymin=dn.min, ymax=dn.max)) + theme_light() + 
  geom_ribbon(aes(x=realtime, ymin=dn.min, ymax=dn.max), alpha=0.5, fill="deeppink") + 
  geom_line(aes(x=realtime, y=dn.div), colour="deeppink", size=1.5) + 
  geom_ribbon(aes(x=realtime, ymin=ds.min, ymax=ds.max), alpha=0.5, fill="tan3") + 
  geom_line(aes(x=realtime, y=ds.div), colour="tan3", size=1.5) + 
  xlab("Time") + ylab("BB Divergence") + 
  scale_x_continuous(breaks = c(2010,2011,2012,2013,2014,2015,2016,2017)) + 
  scale_y_continuous(position = "right") + 
  theme(axis.title.y = element_text(size=25)) +
  theme(axis.title.x = element_text(size=25)) +
  theme(axis.text.y = element_text(size=15)) +
  theme(axis.text.x = element_text(size=15)) 
