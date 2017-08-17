library(data.table)

sampleDT <- data.table(PensionAmount = round(runif(10000, 0, 20000)),
                       PostcodeGroup = sample(LETTERS[1:7], 10000, replace=T),
                       Occupation = sample(c("M","O"), 10000, replace=T),
                       Age = sample(60:100, 10000, replace=T, prob = (100 - 60:100)/sum(100 - 60:100)))

sampleDT[, PensionBand := cut(PensionAmount, seq(0,20000,by=5000), include.lowest=T, right=F,
                              labels = 1:4)]

save(sampleDT, file ="C:/Users/JMaloney/Desktop/SampleData.RData")
