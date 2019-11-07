library(readxl)

library(xlsx)

setwd("C:\\Users\\User\\Desktop\\outliers")



#list_names <- list.files("C:\\Users\\User\\Desktop\\outliers")

if(exists("list_names") == FALSE){
  
  stop("Run list_names script first")
  
}


if (length(list_names) == 0){
  
  stop ("Your folder is empty")
  
}


for (i in 1:length(list_names)){
  
  clvar <- read_xlsx(list_names[i])
  
  data.frame(clvar)
  
  column_names_img <- colnames(clvar)
  
  for (j in 3:length(column_names_img)){
    
    vis_vec <- clvar[[j]]
    
    summary(vis_vec)
    
    print(vis_vec)
    
    png(file = paste(list_names[i], column_names_img[j], ".png",sep=" "))
    
    boxplot(vis_vec, horizontal = TRUE,  main = column_names_img[j], outline = TRUE, xlab = list_names[i], range = 1.5, pdf = TRUE)
    
    stripchart (vis_vec, vertical = FALSE, add = TRUE, method="stack", col = 'red', pch = 20)
    
    dev.off()
    
    
  }
  
}
 

