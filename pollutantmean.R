pollutantmean2 <- function(directory, pollutant, id = 1:332 ) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  mylist <- list.files(path=".", pattern = ".csv")
 
  # Aux variables
  #file_list <- list.files(directory)
  data <- NA
  #For each id passed as parameter:
  for (i in id) {
    #Read the file,
    file_dir <- paste(mylist[i], sep="")
    file_data <- read.csv(file_dir)
    
    # accumulate the data
    data <- rbind(data,file_data)
  }
  
  mean(data[[pollutant]], na.rm = TRUE )
}
