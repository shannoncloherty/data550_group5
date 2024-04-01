library(pacman)
p_load(tidyverse, ggplot2, knitr, labelled, gtsummary)


here::i_am("afia/code/08_treatment_table.R")
projectdata <- read.csv(file = here::here("data/f75_interim.csv"))

var_label(projectdata) <- list(
  agemons = "Age (months)",
  sex = "Sex assigned at birth",
  caregiver = "Primary Caregiver",
  bfeeding = "Current Breastfeeding Status",
  muac = "MUAC (cms) at baseline",
  muac1 = "MUAC (cms) at stabilization",
  muac2 = "MUAC (cms) at discharge/death/widthdrawl",
  arm = "Formula type"
)


table2 <- projectdata %>%
  dplyr::select(agemons, sex, caregiver, muac, muac1, muac2, arm) %>% 
  tbl_summary(by = arm) %>%
  add_overall() %>% 
  add_p() %>% 
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Formula Type**")

saveRDS(
  table2,
  file = here::here("afia/output/08_treatment_table.rds")
)