library(pacman)
p_load(tidyverse, ggplot2, knitr, labelled, gtsummary)


here::i_am("afia/code/07_breastfeeding_graph.R")
projectdata <- read.csv(file = here::here("data/f75_interim.csv"))

# Days to stabilization by breastfeeding status

bf_status <- projectdata %>%   
  filter(days_stable != 999, !is.na(bfeeding)) %>% 
  ggplot( aes(x=bfeeding, y=days_stable)) +
  geom_boxplot() +
  ggtitle("Days to Stabilization by Breastfeeding Status")+
  xlab("Breastfeeding status")+
  ylab("Days to Stabilization")

saveRDS(
  bf_status,
  file = here::here("afia/output/07_bf_graph.rds"))