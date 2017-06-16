
library(plumber)
r <- plumb("scoring.R")  
r$run(port = 8000)

