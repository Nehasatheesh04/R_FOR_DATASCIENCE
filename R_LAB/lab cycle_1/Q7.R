fibonacci_series<-function(n){
  if(n>=1){series<-c(0)}
  if(n>=2){series<-c(series,1)}
  if(n>=3){series<-c(series,1)}
  
  for (i in 4:n) {
    next_term<-series[i-1]+series[i-2]+series[i-3]
    series<-c(series,next_term)
    
  }
  return(series)
}
main<-function(){
  num_terms<-as.integer(readline(prompt = "Enter number of terms"))
  
  if(num_terms<=0){
    cat("number of terms must be positive")
    return()
  }
  
  series<-fibonacci_series(num_terms)
  
  cat("the series with",num_terms,"is:\n")
  cat(series,"\n")
}
main()