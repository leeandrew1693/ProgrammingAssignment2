## The following caches the inverse of a matrix.

## Assignment: Caching the Inverse of a Matrix

## Matrix inversion is usually a costly computation and there may be some benefit to 
## caching the inverse of a matrix rather than computing it repeatedly (there are also 
## alternatives to matrix inversion that we will not discuss here). Your assignment 
##is to write a pair of functions that cache the inverse of a matrix.


## This function creates an object that holds a matrix and the cached value of its inverse. 
## It starts with a null cached value.
makeCacheMatrix <- function(x = matrix()) {
    inverseMatrix <- NULL
    set <- function(y) {
        x <<- y
        inverseMatrix <<- NULL
    }
    get <- function() x
    setInvMatrix<- function(solve)inverseMatrix <<-solve
    getInvMatrix<- function()inverseMatrix
    list(set = set, get= get,
         setInvMatrix=setInvMatrix,
         getInvMatrix=getInvMatrix)
}


## This function gets the inverse of the matrix object we get from makeCacheMatrix and calculates
## the inverse and stores it into the cache. Once the value has been computed once, it will not be
## computed again.
cacheSolve <- function(x, ...) {
    inverseMatrix <- x$getInvMatrix()
    if(!is.null(inverseMatrix)) {
        message("getting cached data")
        return(inverseMatrix)
    }
    data <- x$get()
    inverseMatrix <- solve(data)
    x$setInvMatrix(inverseMatrix)
    inverseMatrix 
}
