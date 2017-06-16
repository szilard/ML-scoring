library(data.table)
library(ROCR)
library(gbm)

d_train <- fread("train-0.1m.csv", stringsAsFactors = TRUE)

system.time({
  md <- gbm(ifelse(dep_delayed_15min=="Y",1,0) ~ ., data = d_train, distribution = "bernoulli",
            n.trees = 100, interaction.depth = 10, shrinkage = 0.1)
})

system.time({
  phat <- predict(md, newdata = d_train, n.trees = md$n.trees, type = "response")
})

rocr_pred <- prediction(phat, d_train$dep_delayed_15min)
performance(rocr_pred, "auc")

for (i in 1:10) {
  d1 <- d_train[i,]
  print(system.time({
    phat1 <- predict(md, newdata = d1, n.trees = md$n.trees, type = "response")[1,1]
  }))
  print(phat1)
}


