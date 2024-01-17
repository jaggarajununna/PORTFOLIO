#MEDIATION analysis 
#to know the impact of wt on mpg through hp
#use inbulit dataset mtcars for analysis
dt<-mtcars
dt
#extract three variabls hp,mpg,wt from mtcars
dt<-dt[c(1,4,6)]
dt
#install psych package
install.packages("psych")
library(psych)
m<-mediate('mpg','wt','hp',data = dt)
m
print(m,short=F)
#interpretation
#total effect wt on mpg is -5.34
#direct effect wt on mpg removing hp is -3.88
#indirect effect wt on hp through mpg is -1.47
#there is partial mediation

