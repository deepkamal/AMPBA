smsdata <- read.csv("sms_spam.csv", stringsAsFactors = FALSE)

#setwd()
str(smsdata)

table(smsdata$type)

spam <- subset(smsdata, type == "spam")
ham <- subset(smsdata, type == "ham")

nrow(spam)/nrow(smsdata)
nrow(ham)/nrow(smsdata)
