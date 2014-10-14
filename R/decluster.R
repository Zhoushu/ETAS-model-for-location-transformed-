
decluster <- function(theta, rbwd, revents, rpoly, tperiod, covr)
{
  tht <- sqrt(theta)
  storage.mode(revents) <- storage.mode(rpoly) <- "double"
  cdeclust <- .Call("declust", as.double(tht), as.double(rbwd), 
                    revents, rpoly, as.double(tperiod), as.double(covr))
  list(revents=cdeclust[[1]], integ0=cdeclust[[2]])
}

