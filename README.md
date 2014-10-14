ETAS-model-for-location-transformed-
====================================
A location transformed method for ETAS model (R language with C core program).

Comparing with ETAS package on cran, this version adding a covariance parameter.

You can use rtools install this package.

Note that the previous data step is the same as http://cran.r-project.org/web/packages/ETAS/ETAS.pdf telling.

You can use the covariance of location variable (longitudinal and latitudinal, numeric) to obtain an ellipse effect area of preivous seismic activity.

Usage:

assume your ppx object is 'x', with its window parameter 'win', period 'tperiod', initial magnitude = 4.5 and initial MLE parameter 'param01', with last location covariance 'covr1'

etas(x, win, tperiod, m0=4.5, param0=param01, no.itr=1,covr = covr1)

More details please check the file "A Transformed method for ETAS.pdf"
