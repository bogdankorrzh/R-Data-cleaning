repeat{

action <- readline(prompt = "Hello, input O, input H, if you want to build histogram, input B, if you want to build boxplots  ")

if (action == "O"){
  
  Find_outliers()
  
}


if (action == "H"){
  
  Build_hist()
  
}

if (action == "B"){
  
  Build_boxplot()
  
}

}
