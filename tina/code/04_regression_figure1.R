here::i_am(
  "tina/code/04_regression_figure1.R"
)

library(ggplot2)

df <- 
  read.csv("data/f75_interim.csv")

model <- lm(weight ~ muac, data = df)

intercept <- coef(model)[1]
slope <- coef(model)[2]

equation <- paste("y = ", round(intercept, 2), " + ", round(slope, 2), "x", sep = "")

reg_plot1 <- ggplot(df, aes(x = muac, y = weight)) + 
  geom_point() +  # Add points
  geom_smooth(method = "lm", se = FALSE) +  
  labs(x = "MUAC", y = "Weight") +  
  annotate("text", x = Inf, y = Inf, label = equation, hjust = 1.1, vjust = 2, size = 3.5) +
  theme_minimal()
