# This code perpresents the ability of R to cache some data in order to save time on reloading the functions (in this code: matrix inversing)

# With the help of getters and setters function "makeCacheMatrix" creates and saves infrormation about the matrix input and it's inverse from the other function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    get <- function() 
      x
    setinv <- function(inversion)
      inv <<- inversion
    getinv <- function()
      inv
    list (set = set, get = get, setinv = setinv, getinv = getinv)
}


# This function takes infos in getters from the 1st function and, if they don't exist, inverses the created matrix and sends the result back to the 1st function

cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  if(!is.null(inv)){
    message("your cached inversion:")
    return(inv)
  }
  data <- x$get()
  inv <- Inverse(data, ...) # a function from a package "matlib"
  x$setinv(inv)
  inv
}