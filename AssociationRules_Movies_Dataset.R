########## Data Set #########
library(arules)
library(arulesViz)

movies <- read.csv(file.choose())


### converting to transact for density value #####
movies1 <- read.transactions(file.choose(),format="basket")

inspect(movies1[1:10])
class(movies1)
summary(movies1)


#transactions as itemMatrix in sparse format with
#11 rows (elements/itemsets/transactions) and
#19 columns (items) and a density of  0.1244019 

itemFrequencyPlot(movies1,topN=20)

#Forming apriori algorithm with lower density than 0.12 to form rules
movies_rules <- apriori(as.matrix(movies[,6:15]),parameter = list(support = 0.05,confidence = 0.05))

summary(movies_rules)
#by selecting support value 0.05 no. of set of 127 rules formed

inspect(movies_rules[1:5])
windows()
plot(movies_rules,method = "scatterplot")
plot(movies_rules,method = "grouped")
plot(movies_rules,method = "graph")
plot(movies_rules,method = "mosaic")

rules <- sort(movies_rules,by="lift")

inspect(rules[1:4])
