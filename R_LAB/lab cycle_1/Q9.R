run_length_encoding<-function(s){
  n<-nchar(s)
  if(n==0)return("")
  
  encoded_string<-""
  count<-1
   for(i in 2:n){
     if(substr(s,i,i)==substr(s,i-1,i-1)){
       count<-count+1
       
     }else{
       encoded_string<-paste0(encoded_string,substr(s,i-1,i-1),count)
       count<-1
       
     }
   }
  encoded_string<-paste0(encoded_string,substr(s,n,n),count)
  return(encoded_string)
}
main<-function(){
  input_string<-readline(prompt = "enter a string:")
  
  compressed_string<-run_length_encoding(input_string)
  
  cat("the compressed string is:",compressed_string,"\n")
}
main()