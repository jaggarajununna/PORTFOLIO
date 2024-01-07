#discriptive statistics
#imported pandas library
import pandas as pd
#imported the dataset
dt=pd.read_excel("C:\\Users\\Dell\\Desktop\\New Microsoft Excel Worksheet - Copy.xlsx")
dt
#to find mean value 
dt.mean()
#to find mode value
dt.mode()
#to find median value
dt.median()
#to find skew value
dt.skew()
#to find kurtosis value
dt.kurt()
dt.kurtosis()
#to find standard deviation
dt.std()
#to find varience
dt.var()
#to find maximum values
dt.max()
#to find minimum value
dt.min()
#to know count of values
dt.count()
#to know discripion of dataset
dt.info()
dt.describe()
#to find length 
len(dt)
#to know the quantile value
dt.quantile()
#sum of values
dt.sum()
#to find null values
dt.isnull()
dt.isnull().sum()
#to know datatype
type(dt)
#to find unique values
dt.nunique()
