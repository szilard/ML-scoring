
import numpy as np
import requests
import time

url = "http://localhost:8000/mean"


tm = np.zeros(1000)

for i in range(1000):
   params = "{x1: " + str(np.random.choice(100,1)[0]) + "}"
   start  = time.time()
   res = requests.get(url, params = params)
   print(res.text)
   tm[i] = time.time() - start

print np.median(tm)*1000




