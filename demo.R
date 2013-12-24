library(quantmod)
library(ggplot2)
# get google financial data from yahoo finance
getSymbols('GOOG', src='yahoo')
# plot data from 2013
png('google.png', width=600, height=400)
barChart(GOOG['2013'])
dev.off()
# create custom fund
myshares=list(Google=5, Apple=25, Coke=30, GM=125, Exxon=45)
mysymbols=c('GOOG', 'AAPL', 'COKE', 'GM', 'XOM')
getSymbols(mysymbols, src='yahoo')
myfund <- rep(0, dim(GOOG['2013'])[1])
mylist <- list(GOOG, AAPL, COKE, GM, XOM)
for (i in 1:length(mylist))  {
  myfund <- myfund + mylist[[i]]['2013'][, 4] * myshares[[i]] # weight by number of shares
}
png('myfund.png', width=600, height=400)
plot(myfund, main='Value of fund vs. date')
dev.off()


