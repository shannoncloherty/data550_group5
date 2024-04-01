# Coder 4 (Afia): Conduct additional analyses based on stratifying by variables of interest 
# with determined cutoffs. One stratified analysis will be based on breastfeeding status, 
# another could be disease of interest, or continuous variable cutoffs. Provide summaries and 
# visualizations for these analyses.

# Descriptive Statistics:
# -	Calculate relevant descriptive statistics for the specified subgroups 
# -	Stratify days to stabilization by treatment arm and breastfeeding status
# Graphs:
# -	Create visualizations specific to the additional analyses conducted
# -	Stratify data by breast feeding and show days until stabilization (box plot for breast feeding)



#loading packages
library(tidyverse)
library(ggplot2)
library(knitr)
library(labelled)
library(gtsummary)


here::i_am("afia/code/06_breastfeeding_table.R")
projectdata <- read.csv(file = here::here("data/f75_interim.csv"))

var_label(projectdata) <- list(
  agemons = "Age (months)",
  sex = "Sex assigned at birth",
  caregiver = "Primary Caregiver",
  bfeeding = "Current Breastfeeding Status",
  muac = "MUAC (cms) at baseline",
  muac1 = "MUAC (cms) at stabilization",
  muac2 = "MUAC (cms) at discharge/death/widthdrawl"
)

# Descriptive stats for breastfeeding
table1 <- projectdata %>%
  dplyr::select(bfeeding, agemons, sex, caregiver, muac, muac1, muac2) %>% 
  tbl_summary(by = bfeeding) %>%
  add_overall() %>% 
  add_p() %>% 
  modify_spanning_header(c("stat_1", "stat_2") ~ "**Breastfeeding status**")

saveRDS(
  table1,
  file = here::here("afia/output/06_bf_table.rds")
)
