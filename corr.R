
corr <- function(directory, threshold = 0) {

	d <- paste("~/learning/coursera/data_science/02-R/week\ 2", directory, sep = "/")
	setwd(d)

	corvec <- vector("numeric", length = 0)
	
	files <- list.files(pattern = "*.csv")
	for (i in files) {
		raw_data <- read.csv(i)
		valid_data <- na.omit(raw_data)
		if(nrow(valid_data) > threshold) {
			corvec <- c(corvec, cor(valid_data$sulfate, valid_data$nitrate))
		}
	}

	setwd("~/learning/coursera/data_science/02-R/week\ 2")
	return(corvec)
}
