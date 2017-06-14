
import pandas as pd
import numpy as np
import requests
import time

url = "http://localhost:8000/mean"


tm = np.zeros(1000)

for i in arange(100): 
   params = "{samples: 10}"
   start  = time.time()
   res = requests.post(url, data = params) 
   tm[i] = time.time() - start
  
print np.median(tm)*1000



