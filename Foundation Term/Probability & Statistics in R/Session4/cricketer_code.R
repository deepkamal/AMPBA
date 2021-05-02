#Manual approach
cricketerdata <- read.csv("cricketer.csv")
is_cricketer <- subset(cricketerdata, Cricketer=="YES")
not_cricketer <- subset(cricketerdata, Cricketer=="NO")
dim(is_cricketer)[1]
dim(not_cricketer)[1]

prob.cricketer <- colSums(is_cricketer[,1:3]== "YES")/6
prob.notcricketer <- colSums(not_cricketer[,1:3]== "NO")/4

prob.cricketer
prob.notcricketer



#Package based approach
install.packages("e1071")
library(e1071)



classify <- naiveBayes(cricketerdata[1:10,1:3],cricketerdata[1:10,4])
classify

y=predict(classify, cricketerdata[11,1:3])
y
