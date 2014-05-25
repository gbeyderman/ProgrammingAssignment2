## Put comments here that give an overall description of what your
## functions do

## Create and cache the matrix. Returns a list of 3 functions to manage the matrix
## and cache saving and retrieval
makeCacheMatrix <- function(x = matrix()) {
 y <- NULL ## Indicator to test if the matrix inverse was cached
 getmatrix <- function() x ## Function that returns the base matrix (to be cached)
 getcache <- function() y  ## Function that returns the cache of the base matrix.
 setcache <- function(x=matrix()) y <<- x ## Function that actually caches the base matrix
 list(getmatrix=getmatrix, getcache=getcache, setcache=setcache) ## Return the three functions
}



## Return a matrix that is the inverse of 'x' base matrix passed into makeCacheMatrix
cacheSolve <- function(x, ...) { 
  z <- x$getmatrix() ## Retrieve the base matrix, save into z.
  y <- x$getcache () ## Attempt to retrieve the cache.
  if(!is.null(y)) { ## If only executes if getcache() returns a matrix.
    message("getting cached inverse")
    return(y)
  }
  y <- solve(z, ...) ## Else, the inverse is computed.
  x$setcache(y) ## Then cached through setcache(y)
  y
}
