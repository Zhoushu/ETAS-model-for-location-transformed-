\name{check.temporal}
\alias{check.temporal}
\title{Check the temporal coordinate of a point pattern}
\description{
  A function to check the temporal coordinate of a spatio-temporal 
  point pattern to be in ascending order. 
}
\usage{
check.temporal(X)
}
\arguments{
  \item{X}{Marked spatio-temporal point pattern (object of class
    \code{"ppx"}).}
}
\value{
  A character string.
}
\details{
  The function produces a message (character string) indicating 
  whether the temporal coordinate of the point pattern is in 
  asceding order or not.
}
\author{Abdollah Jalilian
}
\seealso{
  \code{\link{ppx}}.
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (X) 
{
    tname <- names(X$data)[X$ctype == "temporal"]
    tt <- as.list(X$data)[[tname]]
    for (i in 2:nrow(X$data)) if (tt[i - 1] > tt[i]) 
        stop(paste("event", sQuote(i), "must be replaced with event", 
            sQuote(i - 1)))
    cat("OK! The temporal coordinate of the pattern is in ascending order.\n")
  }
}

\keyword{ spatial }
\keyword{ ppx  }
