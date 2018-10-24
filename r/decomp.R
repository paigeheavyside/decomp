library(ggplot2)

data <- read.csv("../data/data.csv", header = T)
head(data, n=5)

## add new column for season
data$season <- ifelse(data$incubation.time < 70, "summer",
                      ifelse(data$incubation.time > 350, "annual", "winter"))

## add new column for tea type
data$teatype <- substr(data$"box.of.teabag", 1, 1) 

data$percent.decomp <- data$weight.after..dried.at.60.degr.C. / data$weight.only.tea


ggplot(data, aes(x = treat.snow)) +
  geom_point()


