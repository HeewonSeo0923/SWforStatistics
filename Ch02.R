tips = read.csv('tips.csv')

str(tips)

head(tips,10)

summary(tips)

library(dplyr)
library(ggplot2)

tips%>%ggplot(aes(size)) + geom_histogram()
