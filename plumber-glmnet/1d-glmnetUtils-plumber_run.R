
library(plumber)
r <- plumb("1c-glmnetUtils-scoring.R")  
r$run(port = 8000)

