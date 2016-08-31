
complete <- function(directory, id = 1:332) {

	d <- paste("~/learning/coursera/data_science/02-R/week\ 2", directory, sep = "/")
	setwd(d)

	nobs <- c()

	for(i in id) {
		if(i < 10) {
			j <- paste("00", i, sep = "")
		} else if (i >= 10 && i < 100){
			j <- paste("0", i, sep = "")
		} else {
			j <- as.character(i)
		}

		f <- c()
		f[i] <- paste(j, "csv", sep = ".")	
		raw_data <- read.csv(f[i])
		valid_data <- na.omit(raw_data)
		nobs <- c(nobs, nrow(valid_data))
	}

	x <- data.frame(id = id, nobs = nobs)
	return(x)
}
