here::i_am("erika/code/02_boxplots.R")

library(ggplot2)
library(tidyr)
library(dplyr)

# Load the dataset
absolute_path_to_f75_interim <- here::here

data <- read.csv(file = here::here("data/f75_interim.csv"))

# Select only the muac, muac1, and muac2 variables
muac_data <- data[, c("subjid", "arm", "muac", "muac1", "muac2")]
muac_data <- na.omit(muac_data)
# Filter the data for only "Modified F75 (intervention)" and "Standard F75" arms
muac_data_filtered <- muac_data %>%
  filter(arm %in% c("Modified F75 (intervention)", "Standard F75"))

# Convert the data from wide to long format and rename the columns
muac_data_filtered <- muac_data_filtered %>%
  pivot_longer(cols = c(muac, muac1, muac2), 
               names_to = "period_arm", 
               values_to = "muac") %>%
  mutate(period_arm = factor(period_arm, levels = c("muac", "muac1", "muac2"),
                             labels = c("Baseline", "Stabilization", "Endpoint")))

# Create box plot with different colors for each arm
p <- ggplot(muac_data_filtered, aes(x = period_arm, y = muac, fill = arm)) +
  geom_boxplot() +
  scale_x_discrete(labels = c("muac" = "Baseline", "muac1" = "Stabilization", "muac2" = "Endpoint")) +
  labs(x = "Period", y = "MUAC cm", title = "Comparison of MUAC Variables Over Time by Arm") +
  scale_fill_manual(values = c("#a1d99b", "#bdbdbd")) + 
  theme_minimal()

# Save the plot as a PNG file
ggsave(
  here::here("erika/output/02_muac_boxplot.png"), 
  plot = p,
  device = "png",
  width = 6,
  height = 4
)


# Select only the weight, weight1, and weight2 variables
weight_data <- data[, c("subjid", "arm", "weight", "weight1", "weight2")]
weight_data <- na.omit(weight_data)

# Filter the data for only "Modified F75 (intervention)" and "Standard F75" arms
weight_data_filtered <- weight_data %>%
  filter(arm %in% c("Modified F75 (intervention)", "Standard F75"))

# Convert the data from wide to long format and rename the columns
weight_data_filtered <- weight_data_filtered %>%
  pivot_longer(cols = c(weight, weight1, weight2), 
               names_to = "period_arm", 
               values_to = "weight") %>%
  mutate(period_arm = factor(period_arm, levels = c("weight", "weight1", "weight2"),
                             labels = c("Baseline", "Stabilization", "Endpoint")))

# Create box plot with different colors for each arm
p <- ggplot(weight_data_filtered, aes(x = period_arm, y = weight, fill = arm)) +
  geom_boxplot() +
  scale_x_discrete(labels = c("weight" = "Baseline", "weight1" = "Stabilization", "weight2" = "Endpoint")) +
  labs(x = "Period", y = "Weight Kg", title = "Comparison of Weight Variables Over Time by Arm") +
  scale_fill_manual(values = c("#a1d99b", "#bdbdbd")) +  # Set custom colors here
  theme_minimal()

# Save the plot as a PNG file
ggsave(
  here::here("erika/output/02_weight_boxplot.png"), 
  plot = p,
  device = "png",
  width = 6,
  height = 4
)

# Select only the height, height1, and height2 variables
height_data <- data[, c("subjid", "arm", "height", "height2")]
height_data <- na.omit(height_data)

# Filter the data for only "Modified F75 (intervention)" and "Standard F75" arms
height_data_filtered <- height_data %>%
  filter(arm %in% c("Modified F75 (intervention)", "Standard F75"))

# Convert the data from wide to long format and rename the columns
height_data_filtered <- height_data_filtered %>%
  pivot_longer(cols = c(height, height2), 
               names_to = "period_arm", 
               values_to = "height") %>%
  mutate(period_arm = factor(period_arm, levels = c("height","height2"),
                             labels = c("Baseline", "Endpoint")))

# Create box plot with different colors for each arm
p <- ggplot(height_data_filtered, aes(x = period_arm, y = height, fill = arm)) +
  geom_boxplot() +
  scale_x_discrete(labels = c("height" = "Baseline", "height2" = "Endpoint")) +
  labs(x = "Period", y = "Height cm", title = "Comparison of Height Variables Over Time by Arm") +
  scale_fill_manual(values = c("#a1d99b", "#bdbdbd")) +  # Set custom colors here
  theme_minimal()

# Save the plot as a PNG file
ggsave(
  here::here("erika/output/02_height_boxplot.png"), 
  plot = p,
  device = "png",
  width = 6,
  height = 4
)