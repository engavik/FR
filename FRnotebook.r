#tidyverse loads all imp libs for data manip and viz
library(tidyverse)

#reading the given excel sheet
d=read.csv("FR.csv", header=TRUE)

#a glance through the data
head(glimpse(d))

#checking for anomalies in column names
s=colnames(d)
s[1]
s[2]
s[3]

#correcting the first column
"X"->str_sub(s[1], 1, 3)
s[1]

#uniform anomaly, let's correct it
s[1:4]

#corrected
s<-str_replace_all(s, "X", "")
s[1:4]

#converting to consistent Date format
e=as.Date(s[1], "%y.%m.%d")
e

#Applied to all
s<-as.Date(s, "%y.%m.%d")
s[1:4]
class(s[1])

#assigning the corrected header to the dataset
colnames(d)<-s
head(d)

#duplicating for data manipulation
d1<-d

#for the row_count function
install.packages("sjmisc")
library(sjmisc)

#subtracting total number of rows that have NA values in them from the total
c<-599-col_count(d1, count = NA, append = FALSE)
c

#getting just the data of first row out
l<-data.frame(date=colnames(c), count=as.numeric(c[1,]))

#converting to date
l$date<-as.Date(l$date)

head(l)

#plot for the trend
l%>%ggplot(aes(date, count)) + geom_point()


