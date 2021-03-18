corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  corr <- numeric(0)
  data <- NA
  corr_vector <- NA
  mylist <- list.files(path=".", pattern = ".csv")
  j <- 1
  for (i in 1:332)
  {
    file_dir <- paste(mylist[i], sep="")
    file_data <- read.csv(file_dir)
    data <- na.omit(file_data)

    if (nrow(data) >= threshold)
    {
      if (all(is.na(data$nitrate))) next
      corr_vector[j] <- cor(data$sulfate, data$nitrate, use="complete.obs")
      j <- j + 1
    }
  }
  return(corr_vector)
}
