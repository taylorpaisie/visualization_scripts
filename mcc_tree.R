setwd("/Users/taylorpaisie/Dropbox (UFL)/cholera/mar_2018//beast/phylogeography/clin_env_mjmr/")
setwd("/Users/taylorpaisie/Dropbox (UFL)/cholera/mar_2018/beast/phylogeography/sero_mjmr/")

library(ggtree)
library(ggplot2)
library(colorspace)
library(Biostrings)
library(phytools)

#clinical-environmental tree
mcc <- read.beast(file = "clin_env_mjmr_mcc.tree")
mcc

get.fields(mcc)


# colors --> C = "brown1", E = "aquamarine"
ggtree(mcc, aes(color = location), mrsd = "2016-12-28") + scale_color_manual(values=c("mediumpurple4", "springgreen3")) +
  theme_tree2(legend.position="right") + geom_tiplab(size=1.5, color="black") +
  geom_point2(aes(label = round(posterior), subset = posterior >= 0.9), size = 2.5) + 
  theme_tree2(legend.position = "right") + 
  scale_x_continuous(breaks = seq(2010, 2017))

dev.off()


#serotype ogawa/inaba tree
sero <- read.beast(file = "sero_mjmr_mcc_021918.tree")
sero

get.fields(sero)

ggtree(sero, aes(color = location), mrsd = "2016-12-28") + 
  scale_color_manual(name = "Serotype", labels = c("Inaba", "Ogawa"), values=c("darkorange1", "cyan3")) +
  theme_tree2(legend.position="right", legend.title = element_text(vjust = 1, size = 15), legend.text = element_text(size = 10)) + 
  geom_tiplab(size=1.5, color="black") + geom_point2(aes(label = round(posterior), subset = posterior >= 0.9), size = 2.5) +
  scale_x_continuous(breaks = seq(2010, 2017))
  
x<-getStates(sero, "tips")
trees<-make.simmap(sero,x,model="ER",nsim=100)

