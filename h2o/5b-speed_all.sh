
for MODEL in LR RF GBM NN; do
for PM in POJO MOJO; do
  pkill -f jetty-runner.jar &>/dev/null
  sleep 2
  java -jar jetty-runner.jar --port 20000 h2o_${MODEL}_${PM}.war &>/dev/null &
  sleep 5
  echo -n "ho2,$MODEL,$PM,"
  ipython 5a-rest_speed_median.py
done
done


#ho2,LR,POJO,2.05516815186
#ho2,LR,MOJO,2.07090377808
#ho2,RF,POJO,2.28381156921
#ho2,RF,MOJO,2.18892097473
#ho2,GBM,POJO,2.31146812439
#ho2,GBM,MOJO,2.14600563049
#ho2,NN,POJO,2.1960735321

# ^^^ client/network/serving/etc time dominates scoring 




