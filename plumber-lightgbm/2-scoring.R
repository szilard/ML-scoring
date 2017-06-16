library(gbm)

load("lightgbm_model.RData")

#* @get /score
score <- function(Month, DayofMonth, DayOfWeek, DepTime, UniqueCarrier, Origin, Dest, Distance) {
  d1 <- data.frame(Month=Month, DayofMonth=DayofMonth, DayOfWeek=DayOfWeek, DepTime=as.numeric(DepTime), 
          UniqueCarrier=UniqueCarrier, Origin=Origin, Dest=Dest, Distance=as.numeric(Distance), stringsAsFactors = FALSE)
  X1 <- ... 
  predict(md, data = X1)
}



