
import pandas as pd
import requests

df = pd.read_csv("https://s3.amazonaws.com/benchm-ml--main/train-0.1m.csv")
df = df.drop("dep_delayed_15min", 1)
df0 = df.head(1000)
dfN = df.head(2000).tail(1000)
df1 = df.head(2001).tail(1)

url = 'http://localhost:20000/predict'


## python overhead

%time for index, row in df0.iterrows(): \
   params = row.to_json()


## JVM warmup

%time for index, row in df0.iterrows(): \
   res = requests.post(url, data = row.to_json()) 
   
res.text


## time it

%time for index, row in df.iterrows(): \
   res = requests.post(url, data = row.to_json()) 


## time 1 req
   
%time requests.post(url, data = row.to_json())


