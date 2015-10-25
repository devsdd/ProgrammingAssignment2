## Put comments here that give an overall description of what your
## functions do
## Sample input:
## x <- matrix(c(7,6,4,9,3,5,8,1,2))
## m <- makeCacheMatrix(x)
## o <- cacheSolve(m)
##
## Output for above input
## print(o)
## 	[,1]        [,2]       [,3]
## [1,]  0.01265823  0.27848101 -0.1898734
## [2,] -0.10126582 -0.22784810  0.5189873
## [3,]  0.22784810  0.01265823 -0.4177215
##
## o2 <- cacheSolve(m)
## print(o2)
## getting cached data
## 	[,1]        [,2]       [,3]
## [1,]  0.01265823  0.27848101 -0.1898734
## [2,] -0.10126582 -0.22784810  0.5189873
## [3,]  0.22784810  0.01265823 -0.4177215

## Write a short comment describing this function
## Returns a list of four functions to set or get the value of a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL

	## set the original matrix value
        set <- function(y) {
                x <<- y
                i <<- NULL
        }

	## get the original matrix value
        get <- function() x

	## set the inverse value as per what was supplied as the argument from the calling function
        setInverse <- function(inverse) i <<- inverse

	## get the inverse
        getInverse <- function() i
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)

}


## Write a short comment describing this function
## calls functions defined in above function, returns the result of a previous computation if available

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getInverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setInverse(i)
        i
}
