
#! TO DO:
#!   add call to here::i_am
here::i_am("alex/code/01_make_table1.R")

data <- read.csv(
  file = here::here("data/f75_interim.csv")
)

library("labelled")
library("table1")

#Name the variables for the table
var_label(data) <- list(
  site = "Study Site",
  agemons = "Age in months",
  sex = "Sex",
  caregiver = "Main care giver to the child",
  bfeeding = "Child Still Breastfeeding",
  shock = "Shock requiring fluid",
  iconsciousness = "Impaired consciousness",
  sev_pneumonia = "Severe Pneumonia",
  diarrhoea = "Diarrhoea",
  malaria = "Malaria",
  ofillness = "Other Febrile Illness",
  tb = "Known TB (being treated)",
  chronic_cough = "Chronic cough >| month",
  sickle_cell = "Known Sickle Cell Disease",
  heart_disease = "Known congenital or acquired heart disease",
  cerebral_palsy = "Known cerebral palsy or severe developmental delay",
  hiv_results = "HIV antibody test",
  kwash = "Kwashiorkor"
)

#Create a table one of the demographics
table_one <- table1(~ site + agemons + sex + caregiver + bfeeding + shock + iconsciousness + sev_pneumonia + diarrhoea + malaria + ofillness + tb + chronic_cough +  sickle_cell + heart_disease + cerebral_palsy + hiv_results + kwash| arm, data=data, caption = "Table 1: Summary of Demographic Factors by Intervention", render.missing = NULL)


saveRDS(
  table_one,
  file = here::here("alex/output/table_one.rds")
)