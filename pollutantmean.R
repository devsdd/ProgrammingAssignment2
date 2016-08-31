
pollutantmean <- function(directory, pollutant, id = 1:332) {
	
	d <- paste("~/learning/coursera/data_science/02-R/week\ 2", directory, sep = "/")
	setwd(d)

	addition = 0
	valid_entries = 0
	data <- c()

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
		data <- read.csv(f[i])
		if (pollutant == "sulfate") {
			addition <- addition + sum(data$sulfate, na.rm = TRUE)
			valid_entries <- valid_entries + length(na.omit(data$sulfate))
		} else if (pollutant == "nitrate") {
			addition <- addition + sum(data$nitrate, na.rm = TRUE)
			valid_entries <- valid_entries + length(na.omit(data$nitrate))
		}
		i <- i + 1
	}

	return(addition/valid_entries)
}
