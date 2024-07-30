calculate_series_sum<-function(n){
  sum<-0
  
  for(i in 1:n){
    term<-((-1)^(i+1))*(i/(2*i-1))
    sum<-sum+term
  }
  return(sum)
}

main<-function(){
  num_terms<-as.integer(readline(prompt = "Enter the no of terms in the series:"))
  
  series_sum<-calculate_series_sum(num_terms)
  cat("sum of series upto",num_terms,"terms is:",series_sum,"\n")
}

main()