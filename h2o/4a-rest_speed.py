
import pandas as pd
import numpy as np
import requests
import time

df = pd.read_csv("https://s3.amazonaws.com/benchm-ml--main/train-0.1m.csv")
df = df.drop("dep_delayed_15min", 1)
df = df.head(10000)

url = "http://localhost:20000/predict"


tm = np.zeros(10000)

for index, row in df.iterrows(): 
   params = row.to_json()
   start  = time.time()
   res = requests.post(url, data = params) 
   tm[index] = time.time() - start
  
  
pd.DataFrame(tm).to_csv("tm.csv", header = False)





