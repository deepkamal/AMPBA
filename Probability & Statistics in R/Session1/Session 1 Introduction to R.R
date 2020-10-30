#Introduction to R


#Purpose of these sessions is to get introduced with syntax and programming constructs
# of R, and to see how it can be used for data exploration and analysis

# High Level Programming language
# Widely used in academia and research
# Very good collection of packages and tools for statistical analysis and 
# machine learning tools
# Good functionality for textual analysis tools
# Can be used both in interactive mode and the development mode

#We will take a practitioner's based approach. Specifically, we will take data science case studies and try to
# solve them using R. In doing so, we will also look at all of the important syntax and programming constructs in R, 
# and how we leverage them in executing a typical data analytics project.

#R is an eco-system with basic programming constructs at the core. However, bulk of popularity for R comes not from 
# language itself but the vast number of tools and packages available for performing analyses. For example, in order 
# to use an exotic machine learning algorithm such as Random Forests, all that you need to do is call a function.

#R is a case sensitive language
ABC abc
#get current work directory
getwd()

#set a different working directory
setwd('D:/CBA/CBA/R') #For Windows
setwd('/Users/peeyushtaori/Desktop') #For Linux/OS X

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

library(e1071)

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

seq(0,10,0.5)


#Difference between <- and = operator?

sum(z=1:50)
z

sum(ab <- 1:50)
ab


#Five basic data types: Character, Numeric, Integer, Complex, Logical
#Vector is most basic object. Can only contain objects of same class

a <- 7
a
str <- "abc"
str
boolean <- TRUE
boolean

ab<- TRUE

a+str
a+boolean
str+boolean

#Type conversion
x <- "abc"
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
help(sample)
x<-rnorm(1:200)
#This representation of data in a vector allows you to ask mathematical questions easily
mean(x)
max(x)
quantile(x)

x
p<-pnorm(x)
boxplot(x)
boxplot(p)
plot(p,x)
#Generating repeat
rep(4,9)
rep(1:7,10)
rep(1:7,each=3)

#What happens in this case?
rep(1:4,2:5)


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
a[6]
#Access multiple values of a vector
c(1,4)
b <- a[c(1,4)]
b
1:4
d <- a[1:4]
d
#Drop values from a vector
e<-d[-1]
e
a >3
a/5

#Let us say that you want to select subset of a vector based on a condition.
anyvector <- a>3
anyvector
a[anyvector]
a
x <- 1:30
x
x>5
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


