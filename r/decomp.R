library(ggplot2)
library(dplyr)

data <- read.csv("../data/data.csv", header = T, stringsAsFactors = TRUE, strip.white = TRUE, na.strings = c("NA", "na"))
head(data, n=5)
str(data)


## add new column for season
data$season <- ifelse(data$incubation.time < 70, "summer",
                      ifelse(data$incubation.time > 350, "annual", "winter"))

## add new column for tea type
data$teatype <- substr(data$"box.of.teabag", 1, 1) 

## add new column for percent decomposition
data$percent.decomp <- (data$weight.only.tea - data$weight.after..dried.at.60.degr.C.) / data$weight.only.tea

## plot one factor results using treatment and percent decomposition

data$treat.snow <- factor(data$treat.snow, levels = c("D", "M", "C", oredered = TRUE))
ggplot(data, aes(treat.snow, percent.decomp, colour = teatype)) + 
  stat_summary(aes(y=percent.decomp, group = 1), fun.y = mean) +
  geom_point() + 
  facet_wrap(~ season)
  

