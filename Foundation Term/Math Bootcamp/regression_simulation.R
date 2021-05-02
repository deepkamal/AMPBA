# regression simulation 
## these are true values of beta. 
beta0=5 
beta1=-2
x=rnorm(1000,1,2)
hist(x)
err=rnorm(1000,0,1)
hist(err)
y=beta0+beta1*x+err
hist(y)
# run using package
reg.package=lm(y~x);summary(reg.package)

# now use matrix algebra to get to same results. 

#soln from slides will be 
# beta hat = inv(X'X)X'y , remember X has intercept column alsp 

# first update X
X=cbind(rep(1,length(x)),x)
X
# now write the above formula 
beta_hat_matrix_algebra=solve(t(X) %*%X ) %*% t(X) %*% y
beta_hat_matrix_algebra

# but what about the p-values and other things 

# let's find out the variance co-variance matrix
# we know from the slides that estimate of variance is sig_est=e'e/N-k
# variance covariance matrix is given by sig_est* inv(X'X)

res=y-X %*% beta_hat_matrix_algebra
res
# estimate of sigma hat 
sigma_hat=(t(res) %*% res)/(nrow(X)-2)
# now the variance covariance matrix 
sigma_hat=as.numeric(sigma_hat)
vcov.matrix=sigma_hat*solve(t(X) %*%X )
vcov.matrix
# now t-value of b0 and b1
t_val_b0=beta_hat_matrix_algebra[1,1]/sqrt(vcov.matrix[1,1])
t_val_b0
t_val_b1=beta_hat_matrix_algebra[2,1]/sqrt(vcov.matrix[2,2])
t_val_b1
#######



