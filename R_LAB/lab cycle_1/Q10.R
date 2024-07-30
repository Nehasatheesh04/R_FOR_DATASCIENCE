reverse_list<-function(list){
  if(length(list)<=1){
    return(list)
  }
  return(c(reverse_list(list[-1]),list[1]))
}

main<-function(){
  input_string<-readline(prompt = "Enter the elements of the list:")
  input_list<-strsplit(input_string,",")[[1]]
  
  reverse_list<-reverse_list(input_list)
  cat("the reversed list is:",paste(reverse_list,collapse = ", "),"\n")
}

main()

