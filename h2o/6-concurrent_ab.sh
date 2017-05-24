
m4.2xlarge   (8 cores)


ab -k -n 1 "http://localhost:20000/predict?Month=c-8&DayofMonth=c-21&DayOfWeek=c-7&DepTime=1934&UniqueCarrier=AA&Origin=ATL&Dest=DFW&Distance=732"

Requests per second:    1265.82 [#/sec] (mean)
Time per request:       0.790 [ms] (mean)


ab -k -n 1000

Requests per second:    4169.10 [#/sec] (mean)
Time per request:       0.240 [ms] (mean)


ab -k -c 10 -n 1000

Requests per second:    6893.27 [#/sec] (mean)
Time per request:       1.451 [ms] (mean)


ab -k -c 100 -n 1000

Requests per second:    6641.03 [#/sec] (mean)
Time per request:       15.058 [ms] (mean)




