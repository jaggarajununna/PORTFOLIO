#DATA CLEANING 
#imported required libraries
import pandas as pd 
#imported dataset 
dt=pd.read_csv("C:\\Users\\Dell\\Desktop\\data cleaning.csv")
dt
#removed all unwanted characters
dt['name']=dt['name'].str.strip('[@#$%^&*8)]')
dt
dt['marks']=dt['marks'].str.strip('[@#$%^&*)]')
dt
#removed all 'na' in dataset
dt=dt.dropna()
dt
#changed datatype from float to interger
dt['sno']=dt['sno'].astype(int)
dt