setwd("C:/Users/Asus/Documents/R Project")
getwd()

library(tidyverse)
library(ggpmisc)

df <- read.csv("sample.csv")
df$cut = factor(df$cut, levels = c("Fair", "Good", "Very Good", "Premium", "Ideal"))
df$color = factor(df$color , levels = c("J", "I", "H", "G", "F", "E", "D"))
# df$clarity = factor(df$clarity, levels = c("I1", "SI2", "SI1", "VS2", "VS1", "VVS2", "VVS1", "IF"))
df$clarity = factor(df$clarity, levels = c( "IF","VVS1","VVS2", "VS1", "VS2","SI1","SI2","I1"))

my.formula <- y ~ x

ggplot(df, aes(carat, price)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "lm", se = FALSE) + 
  theme_minimal() +
  stat_poly_eq(formula = my.formula, 
               aes(label = paste(..rr.label.., sep = "~~~")), 
               parse = TRUE) +
  facet_wrap(~ color, ncol = 4)

ggplot(df, aes(x=carat, y=price, color=clarity)) + geom_point() +  theme_minimal()
