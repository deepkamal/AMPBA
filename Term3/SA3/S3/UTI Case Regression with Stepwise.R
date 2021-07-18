#There are many libraries which help in Regression.  I am showing couple of them here.
#You can try "SignifReg" (not shown here) to prefix p-value or F-value or AIC etc.
#Requires dataset "ToyotaCorolla.csv" and libraries forecast and leaps
#
#setwd("D:/IIM-U/Predictive Analytics I/2019-20/R Files")
uti.df <- read.csv("uti.csv")
head(uti.df)
# select variables for regression
selected.var <- c(2,3,4,5,6,7,8,9)
uti.df <- uti.df[, selected.var]


# use lm() to run a linear regression of Sales on all appropriate predictors in the model
#
utisales.lm <- lm(SALES ~ MATERIAL+T2+OTINC+EMPL+INT+T, data = uti.df)
# use options() to ensure numbers are not displayed in scientific notation.
options(scipen = 999)
summary(utisales.lm)
#
#
#vcov() gives the Var-cov matrix of the regression coefficients
vmat<- vcov(utisales.lm)
vmat
#Regression with PBT as Dependent Variable
#
utiPBT.lm <- lm(PBT ~ SALES+MATERIAL+T2+OTINC+EMPL+INT+T, data = uti.df)
summary(utiPBT.lm)
#
#Stepwise Regression
# use step() to run stepwise regression.
# set directions = to either "backward", "forward", or "both".
#Forward
utis.lm.stepf <- step(utisales.lm, direction = "forward")
utis.lm.stepf
#
#Backward
utis.lm.stepb <- step(utisales.lm, direction = "backward")
utis.lm.stepb
#
#both
utis.lm.step <- step(utisales.lm, direction = "both")
utis.lm.step
#
#compare all models
summary(utis.lm.stepf)
summary(utis.lm.stepb)
summary(utis.lm.step)
summary(utisales.lm)
#
#
anova(utisales.lm)
anova(utiPBT.lm)
#
#install Package olsrr for stepwise 
install.packages("olsrr")
library(olsrr)

#plot all the subsets of possibilities with different criteria (i.e. R-square, Adjusted R-square, Bayesian criteria)
test <- ols_step_all_possible(utiPBT.lm)
plot(test)
#
#Stepwise regression with ols_step_forward_p(utiPBT.lm, pent = 0.1, prem = 0.3, details = FALSE)
#forward or backward or both
#pent = p-value to enter a variable
#prem = p-value to remove a variable
ols_step_backward_p(utiPBT.lm, pent = 0.1, prem = 0.3, details = FALSE)
ols_step_forward_p(utiPBT.lm, pent = 0.1, prem = 0.3, details = FALSE)
ols_step_both_p(utiPBT.lm, pent = 0.1, prem = 0.3, details = TRUE)

# Use library(car) to calculate DW statistic.
# durbinWatsonTest(model)

library(car)
durbinWatsonTest(utisales.lm)
durbinWatsonTest(utiPBT.lm)
durbinWatsonTest(utis.lm.step)
