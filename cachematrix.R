## this function creates a value for 'i', and a list of four functions that can be retrieved in other functions e.g., cacheSolve.

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL
	set <- function(y) {
		x <<- y
		i <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) i <<- inverse
	getinverse <- function() i
	list(set = set, get=get, setinverse = setinverse, getinverse = 	getinverse)
}

## Checks to see if the inverse has been calculated.  If it has, returns cached value, if not, calculates inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)){
        	message("getting cached data")
        	return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
        
