\name{date2day}
\alias{date2day}
\title{
Convert date-time data to numeric data in days
}
\description{
 A function to convert date-time data to days with respect to a date-time origin. 
}
\usage{
date2day(dates, start, tz = "", ...)
}
\arguments{
  \item{dates}{A date-time or date object. Typically, it is a character 
    vector containing date-time information.}
  \item{start}{A date-time or date object. Determines the origin of the conversion.}
  \item{tz}{Optional. Timezone specification to be used for the conversion.}
  \item{\dots}{Arguments to be passed to \code{as.POSIXlt}.}
}
\value{
  A numeric vector of the same length as \code{dates}.
}
\details{
  The arguments \code{dates} and \code{start} must be of 
  appropriate format to be passed to \code{as.POSIXlt} function.
}
\seealso{

  \code{\link{as.POSIXlt}} and \code{\link{difftime}} for appropriate format of the data
  to be converted.
}

\author{
Abdollah Jalilian
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (dates, start, tz = "", ...) 
{
    start <- as.POSIXlt(start, tz = tz, ...)
    dates <- as.POSIXlt(dates, tz = tz, ...)
    out <- as.numeric(difftime(dates, start, units = "days"))
    return(out)
  }
}
\keyword{spatial}
\keyword{math}
\keyword{date time}
