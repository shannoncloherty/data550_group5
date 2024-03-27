
library(pacman)
p_load(tidyverse, ggplot2, knitr, labelled, gtsummary)


here::i_am("afia/code/04_treatment type_graph.R")
projectdata <- read.csv(file = here::here("data/f75_interim.csv"))

# Days to stabilization by treatment type

trtment_type <- projectdata %>% filter(days_stable != 999) %>% 
  ggplot( aes(x=arm, y=days_stable)) +
  geom_boxplot() +
  ggtitle("Days to Stabilization by formula type")+
  xlab("Formula type")+
  ylab("Days to Stabilization")
trtment_type

saveRDS(
  bf_status,
  file = here::here("afia/output/graph2.rds"))
