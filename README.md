
# Machine Learning Scoring

This repo aims to compare the scoring speed of several open source machine learning
libraries. The focus will be on scoring provided via a REST API (via web requests).


## h2o.ai

Trained LR, RF (100 trees, depth 10), GBM (100 trees, depth 10) and NN (2 hidden layers, 200 neurons each) using h2o and exported Java scoring code. Built a prediction service using Steam. 

Scoring sequentially using Python via REST API. TODO: Parallelize the client (server is multithreaded AFAIK).

Round-trip time is about 2ms for all algos. This includes client request, network trip,
server prep and scoring itself. TODO: Get the breakdown. 

Detailed code and results [here](h2o).

It seems all algos are very fast, maybe scoring itself is <1ms for each of them (LR should be orders of magnitude faster than RF/GBM). TODO: Measure scoring time from Java.

TODO: Concurrency/throughput, some attempts [here](https://github.com/szilard/ML-scoring/tree/master/h2o#thoughput). 


## plumber

The `plumber` R package provides a REST API for an R function. There is a ~5ms overhead (5.8ms measured via the Python client).  


