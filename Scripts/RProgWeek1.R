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





