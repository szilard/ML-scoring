
## 3.10.4.6

library(h2o)
h2o.init(nthreads = -1)

dx_train <- h2o.importFile("https://s3.amazonaws.com/benchm-ml--main/train-0.1m.csv")

system.time({
  md <- h2o.gbm(x = 1:(ncol(dx_train)-1), y = ncol(dx_train), training_frame = dx_train, 
                model_id = "airline_GBM",
                ntrees = 100, max_depth = 10, learn_rate = 0.1, nbins = 100)
})

h2o.download_pojo(md, path = "./gbm-h2o")
h2o.download_mojo(md, path = "./gbm-h2o")

