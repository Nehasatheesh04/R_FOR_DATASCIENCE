is_prime<-function(num){
  if(num<=1){
    return(FALSE)
    }
  for(i in 2:sqrt(num)){
    if(num%%i==0){
      return(FALSE)
    }
  }
  return(TRUE)
}

find_primes_in_range<-function(start,end){
  primes<-c()
  for(num in start:end){
    if(is_prime(num)){
      primes<-c(primes,num)
    }
  }
  return(primes)
}

main<-function(){
  num_to_check<-as.integer(readline(prompt = "Enter the number to check:"))
  
  if(is_prime(num_to_check)){
    cat(num_to_check,"is a prime number.\n")
    
  }else{
    cat(num_to_check,"is not a prime number.\n")
  }
  
  start<-as.integer(readline(prompt = "Enter the start of the range: "))
  end<-as.integer(readline(prompt = "Enter the end of the range:"))
  
  primes<-find_primes_in_range(start,end)
  cat("prime numbers in the range", start,"to", end,"are",primes )
  
  
}
main()