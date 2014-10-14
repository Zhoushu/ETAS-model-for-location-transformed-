\name{etas}
\alias{etas}
\title{Fit the space-time ETAS model to data}
\description{
  A function to fit the space time epidemic type aftershock sequence 
  (ETAS) model to a catalog (point pattern) of earthquakes and perform
  a stochastic declustering method. 
}
\usage{
etas(X, win, tperiod, m0, param0, bwd = NULL, nnp = 5, bwm = 0.05, verbose = TRUE, plot.it = TRUE, no.itr = 11, covr)
}
\arguments{
  \item{X}{Marked spatio-temporal point pattern (object of class
    \code{"ppx"}) representing time, spatial location, magnitude and
    ... of earthquakes.}
  \item{win}{Target geographical region of study (object of class
    \code{"owin"}). Events outside this region are treated as
    complementary events in the log-likelihood.}
  \item{tperiod}{Time period of quakes. A numeric vector of size 2: 
        (tstart, tlength). \code{tstart} is the starting point of 
         time target interval and \code{tlength} is the total length 
         of time period.}
  \item{m0}{Minimum magnitude threshold. A positive numeric value.}
  \item{param0}{Initial guess for model parameters. A numeric vector 
                of appropriate length (currently 8).}
  \item{bwd}{Optional. Bandwidths for smoothness and integration 
             on the geographical region \code{win}. A numeric vector 
             which has the length of the number of events.
             If not supplied, the following arguments \code{nnp} and 
             \code{bwm} determine bandwidths.}
  \item{nnp}{Number of nearest neighbors for bandwidth calculations. An integer.}
  \item{bwm}{Minimum bandwidth. A positive numeric value.}
  \item{verbose}{Logical flag indicating whether to print progress reports.}
  \item{plot.it}{Logical flag indicating whether plot probabilities of
    each event being a background even on a map.}
  \item{no.itr}{An integer indicating the number of iterations for 
               convergence of the iterative approach of declustering algorithm. See details.}
  \item{covr}{ The sd and corr of space.}
}
\value{
  A list with components
  \describe{
    \item{param:}{The ML estimates of model parameters.}
    \item{bk:}{An estimate of the \eqn{u(x, y)}{u(x, y)}.}
    \item{pb:}{The probabilities of being background event.}
    \item{opt:}{The results of optimization: the value of the log-likelihood
      function at the optimum point, its gradient at the optimum point and AIC of the model.}
    \item{rates:}{Pixel images of the estimated total intensity, 
          background intensity, clustering intensity and conditional intensity.}
  }
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
function (X, win, tperiod, m0, param0, bwd = NULL, nnp = 5, bwm = 0.05, 
    verbose = TRUE, plot.it = TRUE, no.itr = 11, covr) 
{
    prep <- etas.prepare(X, win, tperiod, m0, bwd, nnp, bwm, 
        verbose)
    revents <- prep$revents
    rpoly <- prep$rpoly
    rbwd <- prep$rbwd
    rtperiod <- prep$rtperiod
    sname <- prep$sname
    tname <- prep$tname
    N <- nrow(revents)
    k <- ncol(revents)
    if (!is.numeric(param0) || length(param0) != 8 || any(param0 < 
        0)) 
        stop(paste(param0), "must be a numeric vector of length 8 with positive components.")
    param1 <- param0
    names(param1) <- c("mu", "A", "c", "alpha", "p", "D", "q", 
        "gamma")
    thetar <- matrix(, nrow = no.itr, ncol = 8)
    for (itr in 1:no.itr) {
        bkg <- decluster(param1, rbwd, revents, rpoly, tperiod, 
            covr)
        revents <- bkg$revents
        integ0 <- bkg$integ0
        bk <- revents[, 6]
        pb <- revents[, 7]
        if (verbose) {
            cat("iteration: ", itr, "\n")
            cat("======================================================\n")
            cat("background seismicity rate:\n")
            print(summary(bk))
            cat("probability of being a background event:\n")
            print(summary(pb))
            cat("integral of background seismicity rate: ", integ0, 
                "\n")
            cat("======================================================\n")
        }
        if (plot.it) {
            par(mfrow = c(1, 2), mar = c(4, 4, 3, 1))
            cols <- ifelse(pb < 0.5, "red", "blue")
            plot(revents[, 2], revents[, 3], cex = 0.05 + 2.5 * 
                revents[, 4]/m0, col = cols, main = paste("iteration: ", 
                itr), xlab = sname[1], ylab = sname[2])
            plot(win, add = TRUE)
            plot(revents[, 1], pb, xlab = tname, ylab = "probability of being a background event")
            rates0 <- rates(param1, revents, win, tperiod, rbwd, 
                plot.it = plot.it,covr)
        }
        opt <- etasfit(param1, revents, rpoly, tperiod, integ0, 
            verbose, covr)
        thetar[itr, ] <- opt$estimate
        param1 <- thetar[itr, ]
        if (verbose) {
            cat("======================================================\n")
            cat("MLE:\n")
            print(param1)
            cat("======================================================\n")
        }
    }
    rates0 <- rates(param1, revents, win, tperiod, rbwd, plot.it = plot.it, 
        covr)
    names(param1) <- c("mu", "A", "c", "alpha", "p", "D", "q", 
        "gamma")
    out <- list(param = param1, bk = bk, pb = pb, opt = opt, 
        rates = rates0)
    class(out) <- "etas"
    return(out)
  }
}
\keyword{spatial}
\keyword{math}
\keyword{earthquake modeling}
