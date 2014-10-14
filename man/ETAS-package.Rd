\name{ETAS-internal}
\title{Internal ETAS functions}
\alias{etas.prepare}
\alias{rates}
\alias{lambdax}
\alias{lambda}
\alias{etasfit}
\alias{decluster}
\alias{long2flat}
\description{
  Internal ETAS functions.
}
\usage{
etas.prepare(X, win, tperiod, m0, bwd, nnp, bwm, verbose)
rates(theta, revents, win, tperiod, bwd, dimyx=NULL, method="zhuang", plot.it=TRUE,covr)
lambdax(rt, rx, ry, theta, revents,covr)
lambda(t, x, y, param, X, m0, covr)
etasfit(theta, revents, rpoly, tperiod, integ0, verbose,covr)
decluster(theta, rbwd, revents, rpoly, tperiod,covr)
long2flat(X, win)
}

\details{
  These are usually not to be called by the user.
}
\keyword{internal}

