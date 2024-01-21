#LOGISTIC REGRESSIONS:

#THEY ARE TWO TYPES DEPENDING ON NUMBER OF CATEGORIES DEPENDANT VARIABLES
#IF THERE ARE TWO CATEGORIES OF DEPENDANT VARIABLES THEN WE USE BINOMIAL 
#LOGISTIC REGRESSION
#IF THERE ARE THREE CATEGORIES OF DEPENDANT VARIABLES THEN WE USE MULTINOMIAL
#LOGISTIC REGRESSION

#BINOMIAL LOGISTIC REGRESSION:

#assumptions:
#the dependant variable must be categorical
#the independant variable can be contineous or categorical
#no/few outliers


#impact of mpg on vs
#used mtcars dataset to do logistic regression
#import mtcars dataset
dt<-mtcars
dt
#extract mpg and vs from mtcars
dt<-dt[c(1,8)]
dt
#check outliers
boxplot(dt)
#no outliers in the dataset
#check the correlation between variables
#install psych package
install.packages("psych")
library(psych)
pairs.panels(dt)
#there is positive correlation between vs and mpg

#now built model
#binomial logistic regression divided into two types depending on sample size
#logit model is used for big sample size
#probit model is used for small sample size
model<-glm(vs~mpg,data=dt,family=binomial(link="probit"))
model
summary(model)
#the mpg is significantly effecting vs(shape of engine)
#the model fit is good
pred<-predict(model,type="response")
pred
#predicted the model
ypred<-ifelse(pred>0.58,1,0)
ypred
#converted all the mpg value morethan 0.58 as 1 and remaining as 0
mean(mtcars$vs==ypred)*100
#find the accuracy of the model as the values greater tah 75%
d<-data.frame(mpg=c(21,35))
d
#create the dataframe 
predict(model,d,type="response")
#predicted the model with created dataframe
#as the model prediction suggests that the vehicles with 35 mpg have more 
#probability of being straight engines

#MULTINOMIAL LOGISTIC REGRESSION:

#assumtions
#dependant variable must be categorical must be more than two
#independant variable can be contineous and categorical
#there are no/few outliers
#there must be correlation between variables

#useing the inbuilt iris data set 
dt<-iris
dt
#check the outliers
boxplot(dt)
#there are few ouliers in sepal width
#conduct correlation test
#install psych package
install.packages("psych")
library(psych)
pairs.panels(dt)
#there is negative correlation between sepal length and sepal width
#there is negative correlation between petal length and sepal width
#there is positive correlation between petal length and petal width
#there is negative correlation between petal width and species
#there is positive correlation between sepal length and petal width
#there is negative correlation between sepal width and petal width
#there is positive correlation between petal length and species

#install nnet package
install.packages("nnet")
library(nnet)
model<-multinom(Species~.,data=dt)
summary(model)
#predicting the model
pred<-predict(model,type="class")
pred
#testing the accuracy of prediction
mean(dt$Species==pred)*100
#the accuracy is grater than 75% it is a good model
#created the data frame to test the developed model
d<-data.frame(Sepal.Length=1.5,Sepal.Width=2.5,Petal.Length=3.1,Petal.Width=1.5)
d
#predict the model for the data frame
predict(model,d,type="prob")
#as per prediction the flower with following specification has 99.82%
#chance to be versicolor
