import pymysql as pm 
import pandas as pd 
import seaborn as sns 
import matplotlib.pyplot as pyplot
connection=pm.connect(host='localhost',user='root',password='',database='test')
cursor=connection.cursor()
pd.read_sql('desc sqldata;',con=connection)
dt=pd.read_sql('select * from sqldata;',con=connection)
dt
dt.shape
dt.info()
dt.describe()
dt.mean
dt.mode
dt.median
dt.isnull().sum()
dt.nunique()
dt.head()
dt.tail()
dt.count()

