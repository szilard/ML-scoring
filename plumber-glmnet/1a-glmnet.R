library(data.table)
library(ROCR)
library(glmnet)

d_train <- fread("train-0.1m.csv")

X_train <- Matrix::sparse.model.matrix(dep_delayed_15min ~ . - 1, data = d_train)

system.time({
  md <- glmnet( X_train, d_train$dep_delayed_15min, family = "binomial", lambda = 0)
})

system.time({
  phat <- predict(md, newx = X_train, type = "response")[,1]
})

rocr_pred <- prediction(phat, d_train$dep_delayed_15min)
performance(rocr_pred, "auc")

X1 <- X_train[1:2,]
system.time({
  phat1 <- predict(md, newx = X1, type = "response")[1,1]
})

