#define variables
x <- 1
print (x)

msg <- "hello"
print(msg)

#Creating Vectors of different objects
x <- 11:30
print(x)

x <- c(.5,.6)
print(x)

x<- c(TRUE,FALSE)
print(x)

x <- c("a","b","c")
print(x)

x<- 9:29
print(x)

x<- c(1+0i,2+4i)
print(x)

#vector("type",length=n) creates an empty vector of length n
x<- vector("numeric",length=10)
print(x)

#5.7 - mixing objects in vectors doesn't work. "implicit coercion" occurs
y<- c(1.7,"a")
print(y)
#above defaultet to character. can convert 1.7 to string more easily than "a" to a number

y<- c(TRUE,2)
print(y)
#above defaulted to numeric since true/false can be 1/0

y<-c("a",TRUE)
print(y)
#above defaulted to character for same reason as line 34

#change object type of vector with as.desiredobjecttype(vector)
x <- 0:6
print(x)
print(class(x))

as.numeric(x)
print(x)

as.logical(x)
print(x)

as.character(x)
print(x)

#examples of nonsensical coercion that produces NA's and error statements
x<- c("a","b","c")
print(x)

as.numeric(x)
as.logical(x)
as.complex(x)

#creating matricies 
m<-matrix(nrow=2,ncol=3)
print(m)
dim(m)
attributes(m)

m<-matrix(1:6,nrow = 2,ncol = 3)
print(m)

#turn a vector into a matrix by setting dimensions
m<-1:10
print(m)

dim(m) <- c(2,5)
print(m)

#column and row bind vectors to make matricies
x<-1:3
y<-10:12
p<-cbind(x,y)
q<-rbind(x,y)
print(p)
print(q)

#createlists for combining different object types
x<- list(1,"a",TRUE,1+4i)
print(x)

#create empty list
x<-vector("list",length = 5)
print(x)

#dealing with factors (qualitative variables -nominal or ordinal)
x<-factor(c("yes","yes","no","yes","no"))
print(x)
table(x)
unclass(x)
#note: "levels" assigned in alph order by default. can be set manually by:
x<-factor(c("yes","yes","no","yes","no"),levels = c("yes","no"))
print(x)

#create a vector with NAs in it
x<-c(1,2,NA,10,3)
is.na(x)
is.nan(x)

#create vector with NAs and NaNs
x<- c(1,2,NaN,NA,4)
print(x)
is.na(x)
is.nan(x)


#deal with dataframes
x<- data.frame(foo = 1:4, bar = c(T,T,F,F))
print(x)
nrow(x)
ncol(x)

x<- 1:3
names(x)
names(x) <- c("New York", "Seattle","Los Angeles")
print(x)

x <- list("Los Angeles" =1, Boston = 2, London = 3)
print(x)
names(x)
#Boston and London are read as strings automatically without quotes?

library(readr)
library(swirl)

ls()
#list variables currently assigned

rm(list=ls())
ls()
#removes assigned variables

library(readr)
teams <- read_csv("Data/team_standings.csv")
teams

#make first and second colums character type
teams <- read_csv("Data/team_standings.csv", col_types = "cc")
teams

logs <- read_csv("Data/2016-07-19.csv.gz", n_max = 10)
#had error determining type of each column

logs <- read_csv("Data/2016-07-19.csv.gz", col_types = "ccicccccci", n_max = 10)
logs

logs <- read_csv("Data/2016-07-19.csv.gz", col_types = "dcicccccci", n_max = 10)
#gives error.  wasn't expecting dashes in date "2016-07-19"

logs <- read_csv("Data/2016-07-19.csv.gz", col_types = "ccicccccci", n_max = 10)

##Now, only read in the date variable
logdates <- read_csv("Data/2016-07-19.csv.gz", col_types = cols_only(date = col_date()), n_max = 10)
logdates

##Now, section 8

#create data frame
y <- data.frame(a=1,b="a")
##print "dput" output to consol
dput(y)
y

##Send 'dput' output to a file
dput(y, file = "Output/y.R")

#read in 'dput' output from the file
new.y <- dget("Output/y.R")
new.y

x <- "foo"
y <- data.frame(a = 1L, b = "a")

#dump() R objects to a file
dump(c("x","y"),file = "Data/data.R")
rm(x,y)

#source() R objects back from file
source("Data/data.R")
str(y)
x


a <- data.frame(x = rnorm(100), y = runif(100))
b <- c(3, 4.4, 1/3)
#save objects a and b to file
save(a, b, file = "Data/mydata.rda")

rm(a,b)
#load object a and b to the workspace
load("Data/mydata.rda")
a
b

rm(b)
#Save all objects to a file
save.image(file = "Data/mydata.Rdata")
b

#serialize an R object creates a raw vector in hexadecimal
x <- list(1,2,3)
serialize(x,NULL)

#benefit of serialize() is it is the only way to perfectly represent an R object in an exportable format without losing any precision or metadata

#see imputs to "file()" connection funtion
str(file)

#creating connection to file
con <- file("Data/team_standings.csv")
#opening connection in read-only (r = read, w = write, a = appending, rb,wb,ab = all in binary)
open(con, "r")
#Read from the connection
data <- read.csv(con)
#close connection
close(con)
#print object
data

#ALL ABOVE DONE IN BACKGROUND OF READ.CSV()
rm(data)
data <- read.csv("Data/team_standings.csv")
data


#open connection to gz-compressed file
con <- gzfile("Data/2016-07-19.csv.gz")
x <- readLines(con,10)
x

x2 <- read.csv("Data/2016-07-19.csv.gz")
x2

con3 <- gzfile("Data/2016-07-19.csv.gz")
x3 <- readLines(con3,10)
x3

##Open a URL connection for reading
con <- url("http://www.jhsph.edu","r")
#Read the web page
x <- readLines(con)
#print out the first few lines
head(x)







