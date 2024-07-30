
caesar_cipher_encrypt <- function(sentence, shift) {
  
  shift_char <- function(char, shift) {
    if (grepl("[a-z]", char)) {
      new_char <- intToUtf8(((utf8ToInt(char) - utf8ToInt("a") + shift) %% 26) + utf8ToInt("a"))
    } else if (grepl("[A-Z]", char)) {
      new_char <- intToUtf8(((utf8ToInt(char) - utf8ToInt("A") + shift) %% 26) + utf8ToInt("A"))
    } else {
      new_char <- char
    }
    return(new_char)
  }
  
  
  encrypted_sentence <- paste(sapply(strsplit(sentence, NULL)[[1]], shift_char, shift), collapse = "")
  return(encrypted_sentence)
}

main <- function() {
  
  sentence <- readline(prompt = "Enter a sentence to encrypt: ")
  
  shift <- as.integer(readline(prompt = "Enter the shift value: "))
  
  encrypted_sentence <- caesar_cipher_encrypt(sentence, shift)
  
  
  cat("The encrypted sentence is:", encrypted_sentence, "\n")
}


main()