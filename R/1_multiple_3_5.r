# run with the following command
# Rscript 1_multiple_3_5.r
multiple <- function(limit) {
  l <- NULL
  for (i in 1:limit) if(i %% 3 == 0 || i %% 5 == 0) l <- c(l,i)
  sum(l)
}

system.time( result <- multiple(1000) )
result