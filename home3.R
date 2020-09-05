#following the example of the vectors and their means, we can make a similar code 
#and obtain a good result just changing the variables and the mean for the inverse, i.e.:

#As I said before, we change m for inve for specify that is the variable for the inverse.
#I changed the name of the others variables to make it more clear for me since my native 
#language is spanish, but the logic is the same 


makeCacheMatrix <- function(x =matrix()) {
  inve <-    
  dame <- function(y) {
    x <<- y
    inve <<- NULL
  }
  ten <- function() x
  dameinve <- function(inverse) inve <<- inverse
  teninve <- function() inve
  list(dame = dame, ten = ten,
       dameinve = dameinve,
       teninve = teninve)
}

#cacheSolve is also similar to cachemean function, we just need to change the name of the 
#variables for the new ones


cacheSolve <- function(x, ...) {
  inve <- x$teninve()
  if(!is.null(inve)) {
    message("getting cached data")
    return(inve)
  }
  data <- x$ten()
  inve <- solve(data, ...)
  x$dameinve(inve)
  inve
}



