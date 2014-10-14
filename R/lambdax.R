
lambdax <- function(rt, rx, ry, theta, revents, covr)
{
  if (rt < revents[1,1])
   return(0)
  theta <- sqrt(theta)
  storage.mode(revents) <- "double"
  .Call("lambdax", as.double(rt), as.double(rx), as.double(ry), 
        as.double(theta), revents, as.double(covr), PACKAGE="ETAS")[[1]]
}



