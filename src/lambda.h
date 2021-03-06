#include <Rinternals.h>

// *******************************************************************************

double fr(double r, double w[]);

double dgamma_fr(double r, double w[]);

double dD_fr(double r, double w[]);

double dq_fr(double r, double w[]);

// *******************************************************************************

double lambdaj(double *theta, 
               int j, 
               double *t,
               double *x,
               double *y,
               double *m,
               double *bk, 
               double sdX, 
               double sdY, 
               double corrXY);

void lambdajGr(double *theta, 
               int j,
               double *t,
               double *x,
               double *y,
               double *m,
               double *bk, 
	       double *fv, 
	       double *dfv, 
           double sdX, 
           double sdY, 
           double corrXY);

double integj(double *theta, 
              int j, 
              double *t,
              double *x,
              double *y,
              double *m,
              int *np,
              double *px,
              double *py,
              double *tstart2,
              double *tlength, 
              double sdX, 
              double sdY, 
              double corrXY);

void integjGr(double *theta, 
              int j,
              double *t,
              double *x,
              double *y,
              double *m,
              int *np,
              double *px,
              double *py,
              double *tstart2,
              double *tlength, 
              double *fv, 
	      double *dfv, 
          double sdX, 
          double sdY, 
          double corrXY);

// *******************************************************************************

