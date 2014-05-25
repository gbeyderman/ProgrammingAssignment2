## Put comments here that give an overall description of what your
## functions do

## Create and cache the matrix.
makeCacheMatrix <- function(x = matrix()) {
 y <- NULL
 getmatrix <- function() x
 getcache <- function() y
 setcache <- function(x=matrix()) y <<- x
 list(getmatrix=getmatrix, getcache=getcache, setcache=setcache) 
}



## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) { 
  z <- x$getmatrix()
  y <- x$getcache ()
  if(!is.null(y)) {
    message("getting cached inverse")
    return(y)
  }
  y <- solve(z, ...)
  x$setcache(y)
  y
}
