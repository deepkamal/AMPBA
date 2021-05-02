#Let us work with same social data
setwd('/Users/dks/Desktop/AMPBA/Probability & Statistics in R/Session8')
data <- read.csv("social_data.csv")
names(data)


library("ggplot2")
#Let us first try to understand the relationship between friends and age.
qplot(x=age,y=friend_count,data=data)






#How does the plot look like? 
#Young users have lot of friends. People with ages such as 69 or 100 also seem to have high friend count. They
# look like fake accounts

#Issue of overplotting. While we got a sense of data from graph above, it is 
# hard to get idea of how dense points are (especially in lower levels).
#What we can do is reduce density in this case that allows us to observe things
# more clearly. What does this tell us?
ggplot(aes(x=age,y=friend_count),data=data)+geom_point(alpha=1/20)


#Let us now look at relationship between friend_initiated and age.
#Play around with this and see differenet scenarios
ggplot(aes(x=age,y=friendships_initiated),data=data)+geom_point()

#Finding conditional means. Let us again go back to friends count and age.
#This would allow us to see how mean or median changes with other variables

#install.packages('dplyr')
library(dplyr)

age_groups <- group_by(data,age)
conditional_mean_by_age <- summarise(age_groups, friend_count_mean = mean(friend_count),
                                     friend_count_median = median(friend_count), n=n())
head(conditional_mean_by_age)

#What are the observations?
ggplot(aes(age,friend_count_mean),data=conditional_mean_by_age)+
  geom_point()

ggplot(aes(age,friend_count_mean),data=conditional_mean_by_age)+
  geom_line()

ggplot(aes(x=age,y=friend_count),data=data)+geom_point(alpha=1/20,color='orange')+
  geom_line(stat='summary',fun=mean)

ggplot(aes(x=age,y=friend_count),data=data)+geom_point(alpha=1/20,color='orange')+
  geom_line(stat='summary',fun=mean,linetype=1)+
  geom_line(stat='summary',fun=median,linetype=4,color='blue')
  
#Similarly, do it for friends initiated

ggplot(aes(x=age,y=friendships_initiated),data=data)+geom_point(alpha=1/10,color='orange')+
  geom_line(stat='summary',fun=mean)


#Let us now find correlation.
#What are your inferences?
cor.test(data$age, data$friend_count, method='pearson')

#Also, should we be using correlation on this entire set or should we
#use data subsetting? Relate this to what you saw in the graphs earlier?

#Correlation on subset of data
with(subset(data,age<30),cor.test(age,friend_count))

#Let us now create scatter plot. What are your inferences here?
#Any observations about the outliers?
ggplot(aes(x=www_likes_received,y=likes_received),data=data) + 
  geom_point()

cor.test(data$www_likes_received, data$likes_received)


#Why dont we limit the range?
ggplot(aes(x=www_likes_received,y=likes_received),data=data) + 
  geom_point() + 
  xlim(0,quantile(data$www_likes_received,0.95)) +
  ylim(0,quantile(data$likes_received,0.95))

with(subset(data,likes_received<10000),cor.test(www_likes_received,likes_received))

cor.test(data$www_likes_received, data$likes_received)

#Additional Exercise

#Let us now focus a bit more of our attention on correlation
#install.packages('alr3')
library(alr4)
data("Mitchell")
?Mitchell
names(Mitchell)

#What do you observe here?What do you think would be correlation here?
ggplot(aes(x=Month,y=Temp),data=Mitchell)+geom_point()
cor.test(Mitchell$Month, Mitchell$Temp)

#But, should we stop here? Focus specifically on Month. We might need 
# to think about graph more clearly.
ggplot(aes(x=Month,y=Temp),data=Mitchell)+geom_point()+
  scale_x_discrete(breaks=seq(0,203,12))

#Exercise: Create a new column that will assign each month a value 1 to 12
#where 1 is for January, and 12 for December. Plot and find correlation 
#between Temp and this new variable.

