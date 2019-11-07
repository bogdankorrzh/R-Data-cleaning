library(readxl)

library(xlsx)

setwd("C:\\Users\\User\\Desktop\\outliers")

#list_names <- list.files("C:\\Users\\User\\Desktop\\outliers")

build_hist <- function(){
  
if(exists("list_names") == FALSE){
  
  stop("Run list_names script first")
  
}


if (length(list_names) == 0){
  
  stop ("Your folder is empty")
  
}

print(list_names)

for (i in 1:length(list_names)){
  
  clvar <- read_xlsx(list_names[i])
  
  data.frame(clvar)
  
  column_names_img <- colnames(clvar)
  
  print(column_names)
  
  for (j in 3:length(column_names_img)){
    
    vis_vec <- clvar[[j]]
    
    summary(vis_vec)
    
    print(vis_vec)
    
    png(file = paste(list_names[i], column_names_img[j], "hist",".png",sep=" "))  # 
    
    hist((vis_vec), main = c(list_names[i], column_names_img[j] ))
    
    dev.off()
    
  }
  
}

}

build_hist()
