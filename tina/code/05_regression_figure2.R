here::i_am(
  "tina/code/05_regression_figure2.R"
)

library(dplyr)
library(ggplot2)

df <- 
  read.csv("data/f75_interim.csv")

cleaned_df <- cleaned_df %>%
  filter(!is.na(muac1) & !is.na(weight1) & is.finite(muac1) & is.finite(weight1))

cleaned_df$arm <- as.factor(cleaned_df$arm)

data_group1 <- subset(cleaned_df, arm == levels(cleaned_df$arm)[1])
data_group2 <- subset(cleaned_df, arm == levels(cleaned_df$arm)[2])

model_group1 <- lm(weight1 ~ muac1, data = data_group1)
model_group2 <- lm(weight1 ~ muac1, data = data_group2)

coef_group1 <- coef(model_group1)
coef_group2 <- coef(model_group2)

text_group1 <- paste("Modified F75: y =", round(coef_group1[1], 2), "+", round(coef_group1[2], 2), "x")
text_group2 <- paste("Standard F75: y =", round(coef_group2[1], 2), "+", round(coef_group2[2], 2), "x")

plot <- ggplot(cleaned_df, aes(x = muac1, y = weight1, color = arm)) + 
  geom_point() +  
  geom_smooth(method = "lm", se = FALSE) +  
  labs(x = "MUAC1", y = "Weight1", color = "Milk Group") +  
  theme_minimal()

full_plot <- plot + 
  annotate("text", x = Inf, y = Inf, label = text_group1, hjust = 1.1, vjust = 1, size = 3) +
  annotate("text", x = Inf, y = Inf, label = text_group2, hjust = 1.1, vjust = 2, size = 3)

ggsave(
  file = "tina/output/reg_plot2.png",
  plot = full_plot,
  device = "png"
)
