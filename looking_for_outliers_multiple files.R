library(readxl)
library(xlsx)

list_names <- list.files("C:\\Users\\User\\Desktop\\outliers")

if (length(list_names) == 0){
  
  stop ("Your folder is empty")
}



setwd("C:\\Users\\User\\Desktop\\outliers")

if(exists("list_names") == FALSE){
  
  stop("Run list_names script first")
  
}



if (length(list_names) == 0){
  
  stop ("Your folder is empty")
  
}


for (k in 1:length(list_names)){
  
  clvar <- read_xlsx(list_names[k])
  
  data.frame(clvar)
  
  column_names <- colnames(clvar)
  
  
  if (as.character(column_names[1]) != "ID" || as.character(column_names[2]) != "Group"){
    
    print(sprintf("Your dataset %s has not appropriate structure", list_names[k] ))
    
    next()
    
  }
  
  id_vector <- as.character(clvar$ID)
  
  group_vector <- clvar$Group
  
  out <- data.frame(matrix(ncol = 4, nrow = 0))  ## data frame для вывода
  
  headers_vector <- c("ID", "Group", "Value", "Question")
  
  colnames(out) <- headers_vector
  
  
  for (i in 3:length(column_names)){
    
    y <- clvar[[i]]
    
    quantile_arr <- quantile(y, NAMES = FALSE)
    
    first_quantile <- quantile_arr[2]
    
    third_quantile <- quantile_arr[4]
    
    lower_lim <- (first_quantile - 1.5*(third_quantile - first_quantile))
    
    upper_lim <- (third_quantile + 1.5*(third_quantile - first_quantile))
    
    for (j in 1:length(y)){
      
      if(y[j] <= lower_lim){
        
        added <- c(id_vector[j], group_vector[j], y[j], column_names[i])
        
        as.data.frame(added)
        
        out[nrow(out) + 1, ] <- added
        
        print(added)
        
      }
      
      if(y[j]>=upper_lim){
        
        added <- c(id_vector[j], group_vector[j], y[j], column_names[i])
        
        as.data.frame(added)
        
        out[nrow(out) + 1, ] <- added
        
        print (added)
      }
    }
    
  }
  
  #file <- as.character(paste("Outliers_", list_names[k], ".xlsx", sep="")) // запись выбросов в отдельный файл
  
  file <- as.character(paste("Outliers", ".xlsx", sep=""))   # создание файла
  
  write.xlsx(out, file, sheetName = list_names[k], append = TRUE) # запись в файл
}





