#Solved

#1 Create a vector that repeats sequence of all odd numbers between 1 to 10 
# five times, and each number would be repeated four times.

odd_numbers <- seq(1,10,2)
print_numbers <- rep(odd_numbers,times=5,each=4)
print_numbers

#2 Create a data frame with 3 columns and 200 rows. Each column will contain 
# random numbers from 1 to 5.

#Here, we are making use of sample function. It takes two values (in this case 1 and 5),
# and generates 200 numbers between those values. 
col1 <- sample(1:5,size=200,replace=T)
col2 <- sample(1:5,size=200,replace=T)
col3 <- sample(1:5,size=200,replace=T)

df <- data.frame(col1, col2, col3)
df

#3 For the data frame just create above, find number of rows, columns, 
# extract second column, specify structure, and also print top few rows.

nrow(df)
ncol(df)
df$col2
str(df)
head(df)

#4 Sort df in ascending order for col1 and descending order for col3.

df[order(df$col1,-df$col3),]

#5 In this exercise, we will make use of datasets library that comes 
# pre-installed with R and will make use of some sample datasets in the library.
# By doing so, we will try and get started with some very simple data exploration 
# steps that can be easily performed using R.

#In order to use the library, we say 
library(datasets)
library(help=datasets) #Here, you will come to know all of datasets in library
#Let us make use of dataset USArrests
USArrests
#For this dataset, first let us get top 40% states with highest arrests due to Murder category
#We first sort the dataframe according to column Murder
df1 <- USArrests[order(-USArrests$Murder),]
#Next, we find out number of rows that correspond to top 40% states.
nrows <- nrow(df1)*0.40
nrows #There are 20 such rows
#Finally, print those rows
df1[c(1:nrows),]

#Extract all state names with Murder > 5 or Assault > 300
#Here, we will make use of which command in R.

rows <- which(USArrests$Murder>5 | USArrests$Assault>300)
USArrests[rows,]


#Unsolved

#1 Write R code to read an Excel file and save it as a Data Frame. 
#Hint: You might want to explore read.xlsx function in xlsx library in R.

#2 Write R code to read a JSON file in R. You can use any JSON file of your
# liking.

#3 For the data frame created in #2 of Solved questions, write code to insert 
# 10 missing values in each of the three columns. You can insert missing values 
# at random locations. 
# Hint: Missing values are explained in Lecture notes. You might want to make 
# use of sample function and the missing value assignment here.

#4 In continuation of #3, get row numbers in the dataframe that have missing 
# values in col2. 
#Hint: You might want to make use of is.na() function in Lecture Notes.

#5 Make use of the Iris dataset we discussed in the class. On the dataset, 
# perform the following:
#a. Extract last 10 rows and last 3 columns in the dataset.
#b. Get only those rows where Species is of type Setosa, and store the results in a dataframe

#6 For any given number, write a function to compute its square root.
# If the number is negative, then the function should not give an error but 
# instead should print a message "Negative number provided"

#7 Create a vector that has 100 random numbers from 1 to 1000. Write a function 
# that takes this vector as input and returns a vector that has only those 
# values that are greater than average of all values in the vector.


