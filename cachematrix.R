## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
matrix <- NULL  # Initialize the matrix
  cached_inverse <- NULL  # Initialize the cached inverse
  
  # Create a function to set the matrix
  set <- function(mat) {
    matrix <<- mat
    cached_inverse <<- NULL  # Reset the cached inverse
  }
  
  # Create a function to get the matrix
  get <- function() {
    matrix
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         cacheSolve <- function() {
    if (!is.null(cached_inverse)) {
      message("Returning cached inverse")
      return(cached_inverse)
    }
    
    if (is.null(matrix)) {
      stop("Matrix is not set. Use 'set()' to set the matrix.")
    }
    
    inv <- solve(matrix)
    cached_inverse <<- inv  # Cache the inverse
    inv
  }
  
  # Return a list of functions
  list(set = set, get = get, cacheSolve = cacheSolve)
}

# Create a cache matrix
cacheMatrix <- makeCacheMatrix()

# Set the matrix
matrix <- matrix(c(4, 2, 2, 3), nrow = 2)
cacheMatrix$set(matrix)

# Compute and cache the inverse
inverse <- cacheMatrix$cacheSolve()
print(inverse)

# Retrieve the cached inverse
cached_inverse <- cacheMatrix$cacheSolve()
print(cached_inverse)
}
