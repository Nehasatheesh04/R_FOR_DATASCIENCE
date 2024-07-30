cat("Enter a paragraph of text:\n")
paragraph <- readline()

words <- unlist(strsplit(paragraph,"\\W+"))
total_words <- length(words)
cat("Total no of words: ",total_words,"\n")

word_length <- nchar(words)
avg_word_length<-mean(word_length)
cat("Average word length:",avg_word_length,"\n")

longest_word<-words[which.max(word_length)]
cat("Longest word:",longest_word,"\n")

replace_word<-function(paragraph,old_word,new_word){
  gsub(paste0("\\b",old_word,"\\b"),new_word,paragraph,ignore.case = TRUE)
}

cat("Enter the word to be replaced:\n")
old_word<-readline()
cat("Enter the new word:\n")
new_word<-readline()

modified_paragraph<-replace_word(paragraph,old_word,new_word)
cat("modified paragraph:\n",modified_paragraph,"\n")

