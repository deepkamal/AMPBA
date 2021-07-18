#library(openxlsx)
setwd("/Users/dks/AMPBA/Term3/SA3/HW1/")
wage_data_rs=read.csv2('DataExtract.csv',sep = ',')
dim(wage_data_rs)
wage_data_rs
bool_conv <- function(x,FOR) {
  if(x==FOR) 1 else 0
}
#converting categorical to numeric 0/1
wage_data_rs['female'] <- apply(X=wage_data_rs['female'],MARGIN = 1 ,FUN =function(x)bool_conv(x,'F') )
wage_data_rs['nonwhite'] <- apply(X=wage_data_rs['nonwhite'],MARGIN = 1 ,FUN =function(x)bool_conv(x,'N') )
wage_data_rs['union'] <- apply(X=wage_data_rs['union'],MARGIN = 1 ,FUN =function(x)bool_conv(x,'M') )
wage_data_rs['wage'] <- as.numeric(wage_data_rs$wage)
wage_data_rs['age'] <- as.numeric(wage_data_rs$age)
summary(wage_data_rs)

# 1. Calculate the correlation between the variables, Wage, Education and Exper 
# and comment on the correlation coefficients.
corr_data<-cor(wage_data_rs[c('wage','education','exper')])
corr_data

#2. Fit a multiple regression equation with Wage as the dependent variable and 
#all the other variables (except Age) as independent variables. 
# (This is Regression Equation 1)
lr_fit <-lm(wage~female+nonwhite+union+education+exper,data=wage_data_rs,singular.ok=FALSE)
lr_fit
#regression summary
summary(lr_fit)
# to-do : discuss 
#3. Comment on the R2, F-test and individual p values of the coefficients with respect to Regression Equation 1

#4. Fit a multiple regression equation with Wage as the dependent variable and 
#all the other variables (including Age) as independent variables. Explain the results.
lr_fit_4 <-lm(wage~female+nonwhite+union+education+exper+age,data=wage_data_rs,singular.ok=FALSE)
summary(lr_fit)
summary(lr_fit_4)

#5. Find out if the two variables, Education and Exper have any interaction 
# effect with respect to Gender, Race and Union Status

wage_data_rs['eei'] <- (wage_data_rs$education - mean(wage_data_rs$education))*(wage_data_rs$exper - mean(wage_data_rs$exper))

wage_data_rs
interaction_corr_data<-cor(wage_data_rs[c('female','nonwhite','union','eei')])
interaction_corr_data

# 6. Use Stepwise method to fit a regression equation with Wage as the 
# dependent variable and all other variables, including 
# interaction variables as independent variables (This is Regression Equation 2)

#we are using olsrr package, it provides straightforward method to find out and compare stepwise regression for a model
library(olsrr)
lr_fit_all <-lm(wage~female+nonwhite+union+education+age+exper,data=wage_data_rs,singular.ok=FALSE)

#plot all the subsets of possibilities with different criteria (i.e. R-square, Adjusted R-square, Bayesian criteria)
test <- ols_step_all_possible(lr_fit_all)
plot(test)
test

ols_step_both_p(lr_fit_all, pent = 0.1, prem = 0.3, details = TRUE)

ols_step_best_subset(lr_fit_all)

