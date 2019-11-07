setwd("C:\\Users\\User\\Desktop\\outliers")  # working directory with datasets

list_names <- list.files("C:\\Users\\User\\Desktop\\outliers")

if (length(list_names) == 0){
  
  stop ("Your folder is empty")
}

