
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

