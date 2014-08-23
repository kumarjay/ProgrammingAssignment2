#########################################################################################################################
## makeCacheMatrix - 1. creates an object and defines the functions related to the object, the input is the matrix
##					 2. Checks if the input matrix is squre or not, if not reurns without any processing
##					 3. sets the Inverse of the matrix to NULL, inits the value and 
##                   4. returns a list of functions that are part of the object 
#########################################################################################################################

# fyi - For non square matrix need to use ginv() function is MASS package

makeCacheMatrix <- function(x = matrix()) {

	i <- NULL ## initialize the inverse matrix variable to NULL
	
## Set function	, Initializes the matrix and the inverse 
	set <- function(y) {
		x <<- y
		i <<- NULL
	}

## Get Function - returns the original matrix 
		get <- function() { x }

## Set Inverse Matrix - calculates and sets the Matrix Inverse

		setInverse <- function(z) { i <<- solve(z) }

## Get Inverse
		getInverse <- function() { i }

## Creates a list of functions in this and returns this list
		list ( set = set, get = get, setInverse = setInverse, getInverse = getInverse )
}

#########################################################################################################################
## This function checks if the inverse is already calculated, then reads from the cache else calculates the inverse
#########################################################################################################################

cacheSolve <- function(x, ...) {
		a <- x$getInverse()
		if(!is.null(a)) {
			message (" getting cached data ")
			return (a)
		}
	
	data <- x$get()
	b = x$setInverse(data)
	return (b)
#	x$getInverse	
}
