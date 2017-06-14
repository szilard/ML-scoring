
library(plumber)
r <- plumb("0a-plumber-func.R")  
r$run(port=8000)

