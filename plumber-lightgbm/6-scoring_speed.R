library(data.table)
library(ROCR)
library(lightgbm)
library(parallel)
library(Matrix)

set.seed(123)

d_train <- fread("train-0.1m.csv")

y_train <- ifelse(d_train$dep_delayed_15min=='Y',1,0)

d_train_xtra <- lgb.prepare_rules(d_train)    ## changes d_train in place!!!
d_train_num <- d_train_xtra$data
cols_cats <- setdiff(names(d_train_xtra$rules),"dep_delayed_15min")

p <- ncol(d_train)-1
X_train <- as.matrix(d_train_num[,1:p])


dlgb_train <- lgb.Dataset(data = X_train, label = y_train)


system.time({
  md <- lgb.train(data = dlgb_train, objective = "binary", 
                  nrounds = 100, num_leaves = 512, learning_rate = 0.1, categorical_feature = cols_cats)
})


system.time({
  phat <- predict(md, data = X_train)
})
rocr_pred <- prediction(phat, d_train$dep_delayed_15min)
performance(rocr_pred, "auc")



for (i in 1:10) {
  X1 <- X_train[i,,drop=FALSE]
  print(system.time({
    phat1 <- predict(md, data = X1)
  }))
  print(phat1)
}


