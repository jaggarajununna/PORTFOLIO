import pandas as pd
import requests
from bs4 import BeautifulSoup
headers={'Agent-User':'Mozilla/5.0(windows NT 6.3;win64;x64)Applewebkit/537.36(KHTML)'}
url=requests.get('https://www.flipkart.com/search?q=mobiles&as=on&as-show=on&otracker=AS_Query_TrendingAutoSuggest_2_0_na_na_na&otracker1=AS_Query_TrendingAutoSuggest_2_0_na_na_na&as-pos=2&as-type=TRENDING&suggestionId=mobiles&requestId=09dc5383-23fd-474d-9431-37ba6f320da1&p%5B%5D=facets.price_range.from%3DMin&p%5B%5D=facets.price_range.to%3D30000',headers=headers).text
soup=BeautifulSoup(url,'lxml')
soup
details=soup.find_all('div',class_='_13oc-S')
details
name=[]
rating=[]
reviews=[]
price=[]
specs=[]
for i in details:
    name.append(i.find('div',class_='_4rR01T').text.strip())
    rating.append(i.find('div',class_='_3LWZlK').text.strip())
    reviews.append(i.find('span',class_='_2_R_DZ').text.strip())
    price.append(i.find('div',class_='_30jeq3 _1_WHN1').text.strip())
    specs.append(i.find('div',class_='fMghEO').text.strip())
price
dt=pd.DataFrame({'name':name,'rating':rating,'reviews':reviews,'price':price,'specs':specs})
dt
dt.to_csv("C:\\Users\\Dell\\Desktop\\New Microsoft Excel Worksheet.csv")