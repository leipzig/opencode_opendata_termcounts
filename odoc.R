library(ggplot2)
library(dplyr)
library(scales)
oc<-read.csv("opencode.csv")
od<-read.csv("opendata.csv")
oc$term<-"Open code"
od$term<-"Open data"
rbind(oc,od) %>% dplyr::filter(!is.na(Publication.Year)) %>% dplyr::filter(Publication.Year>=2010) %>% dplyr::filter(Publication.Year<=2020) -> o
ggplot(o, aes(x=Publication.Year, fill=term,color=term)) +
  geom_histogram(alpha=0.5, position="identity",binwidth = 1) +
  scale_x_continuous(breaks = seq(2010,2020))
