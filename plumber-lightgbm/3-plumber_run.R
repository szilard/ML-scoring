
library(plumber)
r <- plumb("2-scoring.R")  
r$run(port = 8000)

