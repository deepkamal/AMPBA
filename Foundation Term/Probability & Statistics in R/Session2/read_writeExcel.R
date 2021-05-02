#####Reading a dataset - Excel (xlsx/xls)#####

#using readxl package
install.packages("readxl")
library(readxl)
cars<-read_excel("C:\\Users\\31345\\Downloads\\cars.xlsx") #read xlsx
View(cars)

univ<-read_excel("C:\\Users\\31345\\Downloads\\University.xls") #read xls
View(univ)

#Can also use file.choose() for choosing file interactively 

xyz<-read_xlsx(file.choose()) #read xlsx
View(xyz)

#using xlsx package 
install.packages("xlsx")
library(xlsx)
my_data <- read.xlsx("C:\\Users\\31345\\Downloads\\cars.xlsx", 1, header = T)  # read first sheet
# 1 is the sheet index number
# Header can be True or False, if True, first row taken as columns
#if False, taken as rows

#####Writinging a dataset - Excel (xlsx/xls)#####
setwd("C:\\Users\\31345\\Downloads")
getwd()

#using xlsx package
library(xlsx)
write.xlsx2(mtcars,"mtcars.xlsx", sheetName = "cars1", append = T) #write xlsx
write.xlsx2(BOD,"bod.xls", sheetName = "bod1", append = T) #write xls
#sheetName is used for naming the sheets
#append indicates whether to add to an existing sheet or not
