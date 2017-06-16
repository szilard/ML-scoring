library(data.table)
library(ROCR)
library(xgboost)
library(parallel)
library(Matrix)

set.seed(123)

d_train <- fread("train-0.1m.csv")

X_train <- sparse.model.matrix(dep_delayed_15min ~ .-1, data = d_train)
dxgb_train <- xgb.DMatrix(data = X_train, label = ifelse(d_train$dep_delayed_15min=='Y',1,0))

system.time({
  n_proc <- detectCores()
  md <- xgb.train(data = dxgb_train, nthread = n_proc, objective = "binary:logistic", 
                  nround = 100, max_depth = 10, eta = 0.1)
})

system.time({
  phat <- predict(md, newdata = X_train)
})
rocr_pred <- prediction(phat, d_train$dep_delayed_15min)
performance(rocr_pred, "auc")

X1 <- X_train[1:2,]
system.time({
  phat1 <- predict(md, newdata = X1)
})

save(md, file = "xgboost_model.RData")

