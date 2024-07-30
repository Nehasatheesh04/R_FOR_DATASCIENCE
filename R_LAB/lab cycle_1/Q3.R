validate_age<-function(age){
  if(is.numeric(age)&&age>0){
    return(TRUE)
  }
  return(FALSE)
}

validate_grade<-function(grade){
  valid_grades<-c("A","B","C","D","E","F")
  if(grade %in% valid_grades){
    return(TRUE)
  }
  return(FALSE)
}

read_student_record<-function(){
  valid_ages<-c()
  
  n<-as.integer(readline(prompt = "Enter the number of student records: "))
  
  for(i in 1:n){
    name<-readline(prompt = "Enter student name: ")
    age<-as.numeric(readline(prompt = "Enter student age: "))
    grade<-readline(prompt = "Enter student grade : ")
    
    if(validate_age(age)&&validate_grade(grade)){
      valid_ages<-c(valid_ages,age)
      cat("Record for",name,"is valid.\n")
    }else{
      cat("Record for", name, "is invalid.\n")
    }
  }
  
  if(length(valid_ages)>0){
    avg_age<-mean(valid_ages)
    cat("Average age of valid student record:",avg_age,"\n")
  }else{
    cat("No valid record!!!")
  }
}

read_student_record()