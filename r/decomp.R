library(ggplot2)

data <- read.csv("../data/data.csv")
head(data, n=5)

str(data)

ggplot(data, aes()) +
  geom_point()
