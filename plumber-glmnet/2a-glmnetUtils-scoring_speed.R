library(data.table)
library(ROCR)
library(glmnetUtils)

d_train <- fread("train-0.1m.csv")

system.time({
  md <- glmnet(dep_delayed_15min ~ ., data = d_train, family = "binomial", lambda = 0, sparse = TRUE)
})

system.time({
  phat <- predict(md, newdata = d_train, type = "response")[,1]
})

rocr_pred <- prediction(phat, d_train$dep_delayed_15min)
performance(rocr_pred, "auc")

for (i in 1:10) {
  d1 <- d_train[i,]
  print(system.time({
    phat1 <- predict(md, newdata = d1, type = "response")[1,1]
  }))
  print(phat1)
}



