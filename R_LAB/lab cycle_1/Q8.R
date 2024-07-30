is_palindrome<-function(s){
  s_clean<-tolower(gsub("[[:punct:][:space:]]","",s))
  s_reversed<-paste(rev(strsplit(s_clean,NULL)[[1]]),collapse = "")
  return(s_clean==s_reversed)                 
}

main<-function(){
  input_string<-readline(prompt = "enter a string to check if its a palindrome:")
  
  if(is_palindrome(input_string)){
    cat("The string is palindrome")
  }else{
    cat("the string is not palindrome")
  }
}
main()

