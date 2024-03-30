library(ggplot2)
library(tidyr)

here::i_am("erika/code/03_make_figure2.R")


absolute_path_to_f75_interim <- here::here

data <- read.csv(file = here::here("data/f75_interim.csv"))

# Filter the data for "Modified F75 (intervention)" and "Standard F75" groups
intervention_data <- data[data$arm == "Modified F75 (intervention)", ]
control_data <- data[data$arm == "Standard F75", ]


# Calculate frequencies of sex within each level of oedema for intervention group
intervention_sex_oedema_freq <- table(intervention_data$oedema, intervention_data$sex)

# Create a data frame for intervention group plotting
plot_data_intervention <- as.data.frame(intervention_sex_oedema_freq)
names(plot_data_intervention) <- c("oedema_level", "sex", "frequency")
plot_data_intervention$group <- "Intervention"

# Calculate frequencies of sex within each level of oedema for control group
control_sex_oedema_freq <- table(control_data$oedema, control_data$sex)

# Create a data frame for control group plotting
plot_data_control <- as.data.frame(control_sex_oedema_freq)
names(plot_data_control) <- c("oedema_level", "sex", "frequency")
plot_data_control$group <- "Control"

# Combine data frames for intervention and control groups
plot_data <- rbind(plot_data_intervention, plot_data_control)

# Create stacked bar plot
plot <- ggplot(plot_data, aes(x = oedema_level, y = frequency, fill = sex)) +
  geom_bar(stat = "identity", position = "stack") +
  facet_wrap(~ group) +
  labs(x = "Oedema Level", y = "Frequency", title = "Sex Distribution for Various Levels of Oedema") +
  scale_fill_manual(values = c("#1F77B4", "#FF7F0E"), name = "Sex", labels = c("Male", "Female")) +
  theme_minimal()

# Save the plot
ggsave(
  here::here("erika/output/oedema_barchart.png"), 
  plot = plot,
  width = 6,
  height = 4,
  dpi = 300,
  units = "in",
  device = "png"
)