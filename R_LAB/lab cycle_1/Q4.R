generate_password<-function(length){
  uppercase_letters<-c(LETTERS)
  lowercase_letters<-c(letters)
  digits<-c(0:9)
  special_characters<-c("!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "]", "{", "}", ";", ":", "'", "\"", "<", ">", ",", ".", "?", "/")
  
  all_characters<-c(uppercase_letters,lowercase_letters,digits,special_characters)
  
  password<-sample(all_characters,length,replace = TRUE)
  
  password<-paste(password,collapse = "")
  
  return(password)
}

main<-function(){
  password_length<-as.integer(readline(prompt = "Enter the length of the password"))
  
  password<-generate_password(password_length)
  cat("Generated password:",password,"\n")
}

main()