######MySQL connection wih R#####
#1. Install and call the package 'RMySQL'
#install.packages("RMySQL")
library(RMySQL)

# 2. Settings
db_user <- 'root'
db_password <- '12345'
db_name <- 'sakila'
db_host <- '127.0.0.1' # local access
#db_port <- 3306 #local port


# 3. Read data from db
drv <- dbDriver("MySQL")
mydb <-  dbConnect(drv, user = db_user, password = db_password,
                   dbname = db_name, host = db_host)

##### Reading data #####
# List the tables available in this database.
dbListTables(mydb)

# Query the "actor" tables to get all the rows.
result = dbSendQuery(mydb, "select * from actor")

# Store the result in a data frame object. 
data.frame = fetch(result, n = 5) #fetching first 5 rows
print(data.frame)

#Clear the result to avoid connection errors
dbClearResult(result)

#Using Filters 
result = dbSendQuery(mydb, "select * from film_actor where actor_id = '1'")

# Fetch all the records and store it as a data frame.
data.frame = fetch(result, n = -1)
print(data.frame)

dbClearResult(result)

#####Manipulating data######
# Run this statement to load local data
dbSendQuery(mydb, "SET GLOBAL local_infile = true;")

# Use the R data frame "mtcars" to create the table in MySql.
dbWriteTable(mydb, "mtcars", mtcars[, ], overwrite = TRUE)
# All the rows of mtcars are taken into MySql.

#Updating new rows 
dbSendQuery(mydb, "update mtcars set drat = 4.5 where gear = 4")

#Inserting new values 
dbSendQuery(mydb,
            "insert into mtcars(row_names, mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb)
   values('Ford Highlander', 21, 5, 158.5, 120, 3.6, 2.775, 18.02, 0, 2, 5, 4)"
)

#Dropping Tables
dbSendQuery(mydb, 'drop table if exists mtcars')

#Disconnecting the database 
on.exit(dbDisconnect(mydb))

