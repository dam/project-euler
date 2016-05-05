# Using sieve of Eratosthene
# > Rscript 3_higher_prime_factor.r 

sieveOfEratosthenes <- function(num){
  values <- rep(TRUE, num)
  values[1] <- FALSE	
  prime <- 2
  
  for(i in prime:sqrt(num)) {
     values[seq.int(2 * prime, num, prime)] <- FALSE
     prime <- prime + min(which(values[(prime + 1) : num])) 
  }

  return(which(values)) # Non Eliminited indices
}

primeFactors <- function(num) {
  factors <- NULL
  rest <- num
  limit <- sqrt(num)

  while(rest > limit) {
    for(i in sieveOfEratosthenes(limit)) {
      if(rest %% i == 0) {
        factors <- c(factors, i)
        rest <- rest %/% i 
      }
    }
  }  
  return(factors) 
}

system.time( result <- primeFactors(600851475143) )
print("Using sieve of eratosthenes")
tail(result, n=1)