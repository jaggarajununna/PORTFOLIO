#SIMPLE LINEAR REGRESSION
#it is a statistical method useful for finding relation between two linear 
#variables

#assumptions
#1.independent variable must be continuous. (pre-test assumption)
#2.dependent variable can be continuous and categorica. (pre-test assumption)
#3.data must be linear and continuous. (pre-test assumption)
#4.no or few outliers. (pre-test assumption)
#5.data must correlate. (pre-test assumption)
#6.no autocorrelation. (post-test assumption)
#7.no heteroscedasticity. (post-test assumption)

#use mtcars inbuilt data set in r
dt<-mtcars
dt

#extract two continuous variables mpg and wt
dt<-dt[c(1,6)]
dt

#find outliers using box plot
boxplot(dt)
#there are few outliers in wt 

#install psych package
install.packages("psych")
library(psych)
#test linearity and correlation between mpg and wt variables using pairs.panels
pairs.panels(dt)
#the weight and mpg are negatively correlated(-0.87)
#data is some what linear

#as pre-test assumptions are satisfied proceed for model building
#impact of wt on mpg
model<-lm(mpg~wt,data=dt)
model
summary(model)

#the wt and mpg has negative relation the every one unit increase in wt lead
#to 5.3445 decrease in mpg
#wt is negatively high significantly effecting mpg
#the wt explains 75.58% varience in mpg
#there are 6.8727 errors or residuals in the model

#post test assumptions

#install gvlma package
install.packages("gvlma")
library(gvlma)
#global validation of linear model assumptions
gvlma(model)

#install lmtest package
install.packages("lmtest")
library(lmtest)

#conduct durbin watson test to find autocorrelation of errors
dwtest(model)
#null hypothesis: there is no autocorrelation
#alternative hypothesis: there is autocorrelation
#as p value is less than 0.05 reject null hypothesis
#there is autocorrelation

#conduct brush pagon test to find distribution of errors
bptest(model)
#null hypothesis: there is no heteroscedasticity
#alternative hypothesis: there is heteroscedasticity
#as p value is greater than 0.05 accept null hypothesis
#there is heteroscedasticity



#MULTIPLE LINEAR REGRESSION
#it is a statistical method useful for finding relation between more than two 
#linear variables

#assumptions
#1.independent variable must be continuous and independent variable must
#be more than (pre-test assumption)
#2.dependent variable can be continuous and categorical. (pre-test assumption)
#3.data must be linear and continuous. (pre-test assumption)
#4.no or few outliers . (pre-test assumption)
#5.data must correlate. (pre-test assumption)
#6.no autocorrelation. (post-test assumption)
#7.no heteroscedasticity. (post-test assumption)
#8.no multicolinearity

#use mtcars inbuilt data set in r
dt<-mtcars
dt

#extract three continuous variables mpg and wt,hp
dt<-dt[c(1,6,4)]
dt

#find outliers using box plot
boxplot(dt)
#there are few outlier in wt and hp 

#install psych package
install.packages("psych")
library(psych)
#test linearity and correlation between mpg and wt variables using pairs.panels
pairs.panels(dt)
#the wt and mpg are negatively correlated(-0.87)
#the mpg and hp are negatively correlated(-0.78)
#the wt and hp are positively correlated(0.66)
#data is some what linear

#as pre-test assumptions are satisfied proceed for model building
#impact of wt and hp on mpg
model<-lm(mpg~wt+hp,data=dt)
model
summary(model)

#the wt and mpg has negative relation the every one unit increase in wt lead
#to 5.3445 decrease in mpg
#the hp and mpg has negative relation the every one unit increase in hp lead
#to 0.03177 decrease in mpg
#wt is first high significantly effecting mpg
#hp is second high significantly effecting mpg
#the wt and hp explains 82.68% variance in mpg
#there are 5.854 errors (or) residuals in the model

#post test assumptions

#install gvlma package
install.packages("gvlma")
library(gvlma)
#global validation of linear model assumptions
gvlma(model)

#install lmtest package
install.packages("lmtest")
library(lmtest)

#conduct durbin watson test to find autocorrelation of errors
dwtest(model)
#null hypothesis: there is no autocorrelation
#alternative hypothesis: there is autocorrelation
#as p value is less than 0.05 reject null hypothesis
#there is autocorrelation

#conduct brush pagon test to find distribution of errors
bptest(model)
#null hypothesis: there is no heteroscedasticity
#alternative hypothesis: there is heteroscedasticity
#as p value is greater than 0.05 accept null hypothesis
#there is heteroscedasticity

#multicolinearity test
#install car package
install.packages("car")
library(car)
#conduct varience inflation factor test
vif(model)
#as vif values are less than 2 there is no multicolinearity
#if the values are between 5-10 then it is problematic level

