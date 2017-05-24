
## 3.10.4.6

library(h2o)
h2o.init(nthreads = -1)


dx_train <- h2o.importFile("https://s3.amazonaws.com/benchm-ml--main/train-0.1m.csv")
dx_test <- h2o.importFile("https://s3.amazonaws.com/benchm-ml--main/test.csv")


system.time({
  md_lr <- h2o.glm(x = 1:(ncol(dx_train)-1), y = ncol(dx_train), training_frame = dx_train, 
                   family = "binomial",
                   model_id = "h2o_LR")
})

h2o.auc(h2o.performance(md_lr, dx_test))


system.time({
  md_rf <- h2o.randomForest(x = 1:(ncol(dx_train)-1), y = ncol(dx_train), training_frame = dx_train, 
                    model_id = "h2o_RF",
                    ntrees = 100, max_depth = 10, nbins = 100)
})

h2o.auc(h2o.performance(md_rf, dx_test))


system.time({
  md_gbm <- h2o.gbm(x = 1:(ncol(dx_train)-1), y = ncol(dx_train), training_frame = dx_train, 
                    model_id = "h2o_GBM",
                    ntrees = 100, max_depth = 10, learn_rate = 0.1, nbins = 100)
})

h2o.auc(h2o.performance(md_gbm, dx_test))


system.time({
  md_nn <- h2o.deeplearning(x = 1:(ncol(dx_train)-1), y = ncol(dx_train), training_frame = dx_train, 
                    model_id = "h2o_NN",
                    epoch = 1)
})

h2o.auc(h2o.performance(md_nn, dx_test))



h2o.download_pojo(md_lr, path = "./h2o")
h2o.download_pojo(md_rf, path = "./h2o")
h2o.download_pojo(md_gbm, path = "./h2o")
h2o.download_pojo(md_nn, path = "./h2o")

h2o.download_mojo(md_lr, path = "./h2o")
h2o.download_mojo(md_rf, path = "./h2o")
h2o.download_mojo(md_gbm, path = "./h2o")
##h2o.download_mojo(md_nn, path = "./h2o")   ## not suported 

