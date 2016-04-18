even_fibo <- function(limit) {
  a <- 1
  b <- 1
  l <- NULL	

  while(a < limit) {
    if(a %% 2 == 0) { l <- c(l,a) } 
    c <- a + b
    a <- b
    b <- c
  }
  sum(l)
}

system.time( result <- even_fibo(4000000) )
result