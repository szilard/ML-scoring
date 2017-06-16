
import pandas as pd
import numpy as np
import requests
import time

df = pd.read_csv("https://s3.amazonaws.com/benchm-ml--main/train-0.1m.csv")
df = df.drop("dep_delayed_15min", 1)
df = df.head(500)

url = "http://localhost:8000/score"


tm = np.zeros(500)

for index, row in df.iterrows(): 
   params = row.to_json()
   ##print params
   start  = time.time()
   res = requests.get(url, data = params) 
   tm[index] = time.time() - start
   ##print res.text
  
  
print np.median(tm)*1000





