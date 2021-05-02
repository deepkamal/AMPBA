
#get current work directory
getwd()

#set a different working directory
setwd('D:/CBA/CBA/R')

#getting help
#The simplest way to get help in R is to click on the Help button on the toolbar 
#if you know the name of the function you want help with, you just type a question mark ? at the command line prompt followed by the
#name of the function.
help(solve)
?solve
?read.table

#Sometimes you cannot remember the precise name of the function, but you know the subject on which
#you want help (e.g. data input in this case). Use the help.search function (without a question mark) with
#your query in double quotes like this
help.search("data input")

#Other useful functions are find and apropos. The find function tells you what package something
#is in:
find("lowess")
#while apropos returns a character vector giving the names of all objects in the search list that match your
#(potentially partial) enquiry
apropos("lm")

#Packages are one of the most important eco-system of R. You would be using 
# packages continuously throughout the course and in your professional lives
#Installing a package: You can install a package by using install.packages command
install.packages("e1071")

#In order to view contents of the package, type:

library(help=e1071)


#Language essentials

#Simple calculations: You can simply use R as a calculator
log(50)
5+3
#Multiple expressions can be placed in single line but have to be 
# separated by semi-colons
log(20); 3*35; 5+2

floor(5.3)
ceiling(5.3)
round(5.3)
round(5.9)


#Assignment operations
#Variable assignment is a very easy task in R. There are three important things 
# to keep in mind
# Variable names are case sensitive
# Variable names cannot begin with numbers
# Variable names cannot contain blank spaces
x <- 5
y = 5
print(x)
print(y)
#[1] indicates that x and y are vectors and 5 is the first element of the vector
x <- 1:50
x

#Sequences
0:20

20:6

seq(0,8,0.2)


#Difference between <- and = operator?

sum(z=1:50)
z

sum(ab <- 1:50)
ab





#Five basic data types: Character, Numeric, Integer, Complex, Logical
#Vector is most basic object. Can only contain objects of same class

a <- 4
a
str <- "abc"
str
boolean <- TRUE
boolean

a+str
a+boolean
str+boolean

#Type conversion
x <- "2.5"
class(x)
as.numeric(x)+a



#To identify the type of any object or structure, use class function
class(str)

# Many R operations can be performed, or performed more efficiently, on vectors or
# matrices. Vectors are strings of objects; matrices are two-dimensional collections of
# objects, usually numbers. The c operator, which means concatenate, creates simple
# vectors, while the colon (:) operator generates simple sequences. To construct matrices,
# one simply passes a vector of data, the dimensions of the matrix to be created, and
# whether to input the data by row or by column (the default behavior is to input data by row).                                                by row).

#c() is concatenate function

x <- c(1, 0.5, 4)
x
y <- c("a","b","c")
y
z <- vector("numeric",length=50)
z
help(vector)
y <- c(2.4,"c")
y

#To find the class of a vector, use class function
class(y)
#Length of a vector
length(y)
#This representation of data in a vector allows you to ask mathematical questions easily
mean(x)
max(x)
quantile(x)



#Generating repeat
rep(4,9)
rep(1:7,10)
rep(1:7,each=3)

#What happens in this case?
rep(1:4,1:4)


#Vector Arithematic. You can perform the arithematic operations on vectors in a 
# manner similar to variable operations. Here, the operations are performed on 
#each corresponding elements
x <- c(1, 0.5, 4)
x
y <- c(5,3,2)
y
x+y

#What happens in this case?
x <- c(1, 0.5, 4)
x
y <- c(5,3,2,1)
y
x+y

#What about this case?
x <- c(1, 0.5, 4)
x
y <- c(5,3,2,1,2,4)
y
x+y

a <- c(1,3,2,4,5,2,4,2,6,4,5,3)
a
#Extract individual elements of a vector
a[1]
#Access multiple values of a vector
b <- a[c(1,4)]
b
d <- a[1:4]
d
#Drop values from a vector
d[-1]

a >3
a/5

#Let us say that you want to select subset of a vector based on a condition.
anyvector <- a>3
a[anyvector]

x <- 1:30
x[x>5]


#Table: Perhaps the single most useful vector function in R is table. You need to see it in action to appreciate
#just how good it is. Here is a huge vector called counts containing 10 000 random integers from a negative
#binomial distribution (counts of fungal lesions on 10 000 individual leaves, for instance):

counts <- rnbinom(10000,mu=0.92,size=1.1)
counts[1:30]
table(counts)


#Set theory
setA <- c("a", "b", "c", "d", "e")
setB <- c("d", "e", "f", "g")

union(setA, setB)
intersect(setA, setB)
setdiff(setA,setB)

#List is special type of vector that can contain different types
x <- list(1,"c",FALSE)
x
x[3]
x[1:2]

x <- list(col1=1:3, col2 = 4)
x
x[1]
x[[1]]
x$col1
x$col1[2]
x[[1]][2]

#Matrices
#An array is a multi-dimensional object. The dimensions of an array are specified by its dim attribute, which
#gives the maximal indices in each dimension.
#Creating matrices
m1 <- matrix(nrow=4, ncol=5)
m1
dim(m1)

m1 <- matrix(1:10,nrow=2, ncol=5)
m1
dim(m1)

matrix(data=c(1, 2, 3, 4), byrow=TRUE, nrow=2)

#What happens in this case?
matrix(data=c(1, 2, 3, 4, 5), byrow=TRUE, nrow=2)

x<- matrix(1:10,2,5)
x
x[1,1]
x[1,]
x[,2]



#Column bind and row bind for matrices
x<- 1:6
x
y <- 12:17
y
cbind(x,y)

rbind(x,y)

#What happens in this case?
x<- 1:5
x
y <- 12:17
y
cbind(x,y)

rbind(x,y)


#Factors - can be used to represent categorical data
#Factors are categorical variables that have a fixed number of levels. A simple example of a factor might be
#a variable called gender with two levels: 'female' and 'male'. If you had three females and two males, you
#could create the factor like this

#What is the difference between a categorical and continuous data? 

gender <- factor(c("female", "male", "female", "male", "female"))
class(gender)
mode(gender)

x <- factor(c("yes","no","maybe","yes","no"))
x
unclass(x)


#Tabular data is read into a type of data structure known as data frame.
#All variables in a data frame are stored as separate columns
#Different from matrix in the sense that each column can be of a different type
#Almost always, when you import data from an external data source, you import 
# it using a data frame
x <- data.frame(col1=1:20, col2 = c(T, F, F, T))
x
nrow(x)
ncol(x)
#Check structure of a data frame
str(x)

#Element selection operations are similar to what we have for matrics
x[1]
x[1,1]
x[,2]
x[2:5,1]

#There is also one more operator $ for selecting specific columns of a dataframe
x$col1
#What in this case?
x$1

subset(x,subset=1)




#Conditional Statements
#IF
x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")


#FOR
for (j in 1:5){
  print(j)
}



x <- c("a","c","d")
for (i in seq_along(x)){
  print(x[i])
}
for (letter in x){
  print(letter)
}


x <- matrix(1:10,2,5)
x
for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}


#WHILE
a <- 10
while (a>0){
  print(a)
  a<-a-1
}


#Functions
#Functions in R are objects that are of class function.
func1 <- function(a,b){
  a+b
}

func1(5,10)


square.it <- function(x) {
  square <- x * x
  return(square)
}

square.it(5)

#Loop functions
#lapply - Loop a list and apply a function on each element of list. Result is a list
x <- list(a=1:10, b=rnorm(10))
x
lapply(x,mean)

x <- 1:4
lapply(x,runif)#uniform random variables

#sapply-Simplifies results from lapply. returns a vector if list element is of length 1
#matrix if every element in list of same length, otherwise returns a list

x <- list(a=1:5, b=rnorm(6),c=rnorm(25))
lapply(x,mean)
sapply(x,mean)

#apply - evaluate a function on the margin of an array. Replacement for a for loop
x <- matrix(rnorm(20),2,10)
x
apply(x,2,mean)
apply(x,1,sum)

#t-apply function
#We will use the iris dataset for this example. Load the iris dataset.
data(iris)
#Tells us structure of dataset
str(iris)
#Mean of a variable
mean(iris$Sepal.Length)
#calculate the mean of the Sepal Length but broken by the Species
tapply(iris$Sepal.Length,iris$Species,mean)

#Again, let us do it with one more dataset
data("mtcars")
#What is the structure of dataset
str(mtcars)
#avg mpg for the various transmission types and number of cylinders in car. This is nothing but avg mpg grouped by transmission type and the number of cylinders in car.
tapply(mtcars$mpg, list(mtcars$cyl,mtcars$am),mean)

#Find closest values. Use which function for finding the closes value in a dataset. 
xv <- rnorm(1000,100,10)
which(abs(xv-108)==min(abs(xv-108)))
xv[761]



#Missing values, infinity.
#Many times, mathematical calculations result in Infinity. Infinity is represented by 
#Inf (-Inf) in R
8/0

#Other times, you can get values that are not numbers. They are represented by 
# NaN
0/0

Inf - Inf

#What about Inf + Inf

Inf + Inf

#Missing values in dataframes are a real source of irritation, because they affect the way that model-fitting
#functions operate and they can greatly reduce the power of the modelling that we would like to do.
#Missing values are either NA or NaN. 
# is.na() and is.nan are used for testing na values.
x <- c(1,5,NA,8,NA,12,NaN)
is.na(x)
is.nan(x)

#Remove missing values
x <- c(1,4,3,8,NA,23,54,NA,NA)
missingvalues <- is.na(x)
x[!missingvalues]

#What should be the output here
mean(x)

mean(x,na.rm=T)



#Date and Time functions
#Date class is used to represent dates. Internally, dates are number of days after 1970-01-01
#POSIXlt or POSIXct is used to represent times. 
x<- as.Date("1970-01-01")
x
unclass(x)

unclass(as.Date("2014-12-12"))

x<-Sys.time()
p<-as.POSIXlt(x)
p
names(unclass(p))
p$hour
p$sec



#Matrices
#An array is a multi-dimensional object. The dimensions of an array are specified by its dim attribute, which
#gives the maximal indices in each dimension.
#Creating matrices
m1 <- matrix(nrow=4, ncol=5)
m1
dim(m1)

m1 <- matrix(1:10,nrow=2, ncol=5)
m1
dim(m1)

matrix(data=c(1, 2, 3, 4), byrow=TRUE, nrow=2)

#What happens in this case?
matrix(data=c(1, 2, 3, 4, 5), byrow=TRUE, nrow=2)

x<- matrix(1:10,2,5)
x
x[1,1]
x[1,]
x[,2]



#Column bind and row bind for matrices
x<- 1:6
x
y <- 12:17
y
cbind(x,y)

rbind(x,y)

#What happens in this case?
x<- 1:5
x
y <- 12:17
y
cbind(x,y)

rbind(x,y)


#Factors - can be used to represent categorical data
#Factors are categorical variables that have a fixed number of levels. A simple example of a factor might be
#a variable called gender with two levels: 'female' and 'male'. If you had three females and two males, you
#could create the factor like this

#What is the difference between a categorical and continuous data? 

gender <- factor(c("female", "male", "female", "male", "female"))
class(gender)
mode(gender)

x <- factor(c("yes","no","maybe","yes","no"))
x
unclass(x)


#Tabular data is read into a type of data structure known as data frame.
#All variables in a data frame are stored as separate columns
#Different from matrix in the sense that each column can be of a different type
#Almost always, when you import data from an external data source, you import 
# it using a data frame
x <- data.frame(col1=1:20, col2 = c(T, F, F, T))
x
nrow(x)
ncol(x)
#Check structure of a data frame
str(x)

#Element selection operations are similar to what we have for matrics
x[1]
x[1,1]
x[,2]
x[2:5,1]

#There is also one more operator $ for selecting specific columns of a dataframe
x$col1



#Conditional Statements
#IF
x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")


#FOR
for (j in 1:5){
  print(j)
}



x <- c("a","c","d")
for (i in seq_along(x)){
  print(x[i])
}
for (letter in x){
  print(letter)
}


x <- matrix(1:10,2,5)
x
for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}


#WHILE
a <- 10
while (a>0){
  print(a)
  a<-a-1
}


#Functions
#Functions in R are objects that are of class function.
func1 <- function(a,b){
  a+b
}

func1(5,10)


square.it <- function(x) {
  square <- x * x
  return(square)
}

square.it(5)

#Loop functions
#lapply - Loop a list and apply a function on each element of list. Result is a list
x <- list(a=1:10, b=rnorm(10))
x
lapply(x,mean)

x <- 1:4
lapply(x,runif)#uniform random variables

#sapply-Simplifies results from lapply. returns a vector if list element is of length 1
#matrix if every element in list of same length, otherwise returns a list

x <- list(a=1:5, b=rnorm(6),c=rnorm(25))
lapply(x,mean)
sapply(x,mean)

#apply - evaluate a function on the margin of an array. Replacement for a for loop
x <- matrix(rnorm(20),2,10)
x
apply(x,2,mean)
apply(x,1,sum)

#t-apply function
#We will use the iris dataset for this example. Load the iris dataset.
data(iris)
#Tells us structure of dataset
str(iris)
#Mean of a variable
mean(iris$Sepal.Length)
#calculate the mean of the Sepal Length but broken by the Species
tapply(iris$Sepal.Length,iris$Species,mean)

#Again, let us do it with one more dataset
data("mtcars")
#What is the structure of dataset
str(mtcars)
#avg mpg for the various transmission types and number of cylinders in car. This is nothing but avg mpg grouped by transmission type and the number of cylinders in car.
tapply(mtcars$mpg, list(mtcars$cyl,mtcars$am),mean)

#Find closest values. Use which function for finding the closes value in a dataset. 
xv <- rnorm(1000,100,10)
which(abs(xv-108)==min(abs(xv-108)))
xv[761]



#Missing values, infinity.
#Many times, mathematical calculations result in Infinity. Infinity is represented by 
#Inf (-Inf) in R
8/0

#Other times, you can get values that are not numbers. They are represented by 
# NaN
0/0

Inf - Inf

#What about Inf + Inf

Inf + Inf

#Missing values in dataframes are a real source of irritation, because they affect the way that model-fitting
#functions operate and they can greatly reduce the power of the modelling that we would like to do.
#Missing values are either NA or NaN. 
# is.na() and is.nan are used for testing na values.
x <- c(1,5,NA,8,NA,12,NaN)
is.na(x)
is.nan(x)

#Remove missing values
x <- c(1,4,3,8,NA,23,54,NA,NA)
missingvalues <- is.na(x)
x[!missingvalues]

#What should be the output here
mean(x)

mean(x,na.rm=T)



#Date and Time functions
#Date class is used to represent dates. Internally, dates are number of days after 1970-01-01
#POSIXlt or POSIXct is used to represent times. 
x<- as.Date("1970-01-01")
x
#unclass(x)

unclass(as.Date("2014-12-12"))

x<-Sys.time()
p<-as.POSIXlt(x)
p
names(unclass(p))
p$hour
p$sec

#Reading data into R. 
#There are a range of funtions for reading data into R. read.table and read.csv are most common for tables
#readLines for text data, load for workspaces
#Similarly, for write use write.table, write.Lines, save
#reading data from a csv file

#read.table is the most versatile and powerful function for reading data from 
# external sources
inputdata <- read.table("inputdata.txt",header=TRUE)

#While you can import data using read.table function as well, there are specific 
# functions for csv and excel files
titanicdata <- read.csv("train.csv")
datafile1 <- read.table("train.csv",header=TRUE,sep=",") 


#Writing data to R. Similar to the functions for reading files in R, there are functions for writing back
# data frames to R. Here are some of the most common examples that you would encounter. This list is not 
# exhaustive and there are many more functions available for working with different file types.

write.csv(titanicdata,"/Users/suppi/Desktop/CBA_Batch10_PreTerm/file1.csv")

#Visualization in R
#With ever increasing volume of data, it is impossible to tell stories 
#without visualizations. Data visualization is an art of how to turn numbers into useful knowledge.

#Four basic presentation types
#Comparison
#Composition
#Distribution
#Relationship

#Correspondingly, most common charts are:
#Scatter
#Histogram
#Bar
#Box
#Heat Map
#Correlogram

#FOr basic graphs, use plot command
#It takes in many parameters from x axis data , y axis data, x axis labels, y axis labels, color and title.


library(RColorBrewer)

#Histogram
data(VADeaths)
par(mfrow=c(2,3))
hist(VADeaths,breaks=10, col=brewer.pal(3,"Set3"),main="Set3 3 colors")
hist(VADeaths,breaks=3 ,col=brewer.pal(3,"Set2"),main="Set2 3 colors")
hist(VADeaths,breaks=7, col=brewer.pal(3,"Set1"),main="Set1 3 colors")
hist(VADeaths,breaks= 2, col=brewer.pal(8,"Set3"),main="Set3 8 colors")
hist(VADeaths,col=brewer.pal(8,"Greys"),main="Greys 8 colors")
hist(VADeaths,col=brewer.pal(8,"Greens"),main="Greens 8 colors")


#Line Plot
plot(AirPassengers,type="l")  


#Bar Plot
barplot(iris$Petal.Length)


#Box Plot
boxplot(iris$Petal.Length~iris$Species)


plot(x=iris$Petal.Length) #Simple Scatter Plot
plot(x=iris$Petal.Length,y=iris$Species) #Multivariate Scatter Plot


#Let us do some map visualizations
devtools::install_github("rstudio/leaflet")


library(magrittr)
library(leaflet)
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=77.2310, lat=28.6560, popup="The delicious food of chandni chowk")
m  # Print the map

#You could use another library called ggplot2

library(ggplot2)  

visualizations <- read.csv("VisualizationData.csv")
#Scatter plot
ggplot(visualizations, aes(Item_Visibility, Item_MRP)) + geom_point() + scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+ scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ theme_bw() 

ggplot(visualizations, aes(Item_Visibility, Item_MRP)) + geom_point(aes(color = Item_Type)) + 
  scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+
  scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+
  theme_bw() + labs(title="Scatterplot")

ggplot(visualizations, aes(Item_Visibility, Item_MRP)) + geom_point(aes(color = Item_Type)) + 
  scale_x_continuous("Item Visibility", breaks = seq(0,0.35,0.05))+
  scale_y_continuous("Item MRP", breaks = seq(0,270,by = 30))+ 
  theme_bw() + labs(title="Scatterplot") + facet_wrap( ~ Item_Type)

#Bar chart
ggplot(visualizations, aes(Outlet_Establishment_Year)) + geom_bar(fill = "red")+theme_bw()+
  scale_x_continuous("Establishment Year", breaks = seq(1985,2010)) + 
  scale_y_continuous("Count", breaks = seq(0,1500,150)) +
  coord_flip()+ labs(title = "Bar Chart") + theme_gray()

#Heat Map
ggplot(visualizations, aes(Outlet_Identifier, Item_Type))+
  geom_raster(aes(fill = Item_MRP))+
  labs(title ="Heat Map", x = "Outlet Identifier", y = "Item Type")+
  scale_fill_continuous(name = "Item MRP") 


#Spam code

smsdata <- read.csv("sms_spam.csv", stringsAsFactors = FALSE)

#setwd()
str(smsdata)

table(smsdata$type)

spam <- subset(smsdata, type == "spam")
ham <- subset(smsdata, type == "ham")

nrow(spam)/nrow(smsdata)
nrow(ham)/nrow(smsdata)




#Cricketer code

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



############# Binomial Distribution#########

??dbinom




#Session 7 and 8

#Let us work with some Social media data
#Goal is to understand user behavior one variable at a time

data <- read.csv("social_data.csv")
#What does names do?
names(data)
str(data)

#We will make use of ggplot 2 package. Used for visualizations.
install.packages("ggplot2")
library("ggplot2")

#Use qplot function to plot a histogram. For example, let us plot 
# date of birth by day.
#What do you expect to find?
qplot(x=dob_day,data=data)


#What does this code do? 
#What insights can you derive?
qplot(x=dob_day,data=data) + facet_wrap(~dob_month,ncol=3)


#Create a histogram of friend count
qplot(x=friend_count, data=data)
#What do you find?

#Let us limit count and then see
qplot(x=friend_count, data=data, xlim=c(0,1000))


#Let us look at friend count by gender
qplot(x=friend_count, data=data, binwidth=25) + 
  scale_x_continuous(limits=c(0,1000),breaks=seq(0,1000,50))+
  facet_wrap(~gender)

#Let us omit NA values
qplot(x=friend_count, data=subset(data,!is.na(gender)), binwidth=25) + 
  scale_x_continuous(limits=c(0,1000),breaks=seq(0,1000,50))+
  facet_wrap(~gender)
#By looking at above plots can you tell which gender has more friends 
#on average?

#Which gender has more friends by average? Is median better than mean?
#Long tailed data. Median is better measure than mean.
table(data$gender)
by(data$friend_count, data$gender, summary)


#Since how long people are using FB?
qplot(x=tenure, data=data, binwidth=30)
#Create in years
qplot(x=tenure/365, data=data, binwidth=1)


#What can we say about ages? What is min age?
qplot(x=age, data=data, binwidth=1)
summary(data$age)

#Let us transform some data. What about friend count variable? It is long tail variable.
#These are over dispersed data. We transform them so that their tail is 
# shortened
qplot(x=friend_count,data=data)
summary(data$friend_count)

summary(log(data$friend_count))
#What is going on?


summary(log(data$friend_count+1))

#another kind of transformation
summary(sqrt(data$friend_count))

qplot(x=friend_count,data=data)

qplot(x=log(friend_count+1),data=data)

#Let us create multiple histograms on one plot
install.packages('gridExtra')
library(gridExtra)

a<-qplot(x=friend_count,data=data)
b<-qplot(x=log(friend_count+1),data=data)
c<-qplot(x=sqrt(friend_count),data=data)

grid.arrange(a,b,c,ncol=1)
#What can we say about these?


#Let us now look at likes. How would this help your business?
by(data$www_likes,data$gender,sum)


#Box plot. How does it look? How many outliers are there?
qplot(x=gender, y=friend_count, data=subset(data,!is.na(gender)),geom='boxplot')


qplot(x=gender, y=friend_count, data=subset(data,!is.na(gender)),geom='boxplot',ylim=c(0,1000))

qplot(x=gender, y=friend_count, data=subset(data,!is.na(gender)),geom='boxplot')+
  coord_cartesian(ylim=c(0,1000))
#Differences between the above two commands?

#Let us now look at who initiates more friend requests
qplot(x=gender, y=friendships_initiated, data=subset(data,!is.na(gender)),geom='boxplot')+
  coord_cartesian(ylim=c(0,1000))

by(data$friendships_initiated, data$gender, summary)


#What about mobile devices?
summary(data$mobile_likes)
#What percentage of people use mobile devices?
summary(data$mobile_likes>0)






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

install.packages('dplyr')
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
  geom_line(stat='summary',fun.y=mean)

ggplot(aes(x=age,y=friend_count),data=data)+geom_point(alpha=1/20,color='orange')+
  geom_line(stat='summary',fun.y=mean)+
  geom_line(stat='summary',fun.y=median,linetype=2,color='blue')




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





