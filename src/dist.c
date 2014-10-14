#include <Rmath.h>
//calc the ellipse area and distance
double dist(double x1, double y1, double x2, double y2, double sdX, double sdY, double corrXY)
{
  return sqrt((sdY * (x1 - x2) * (x1 - x2) / sdX + sdX * (y1 - y2) * (y1 - y2) / sdY - 2 * corrXY * (x1 - x2) * (y1 - y2))/(sqrt(1 - corrXY)));
}

double dist2(double x1, double y1, double x2, double y2, double sdX, double sdY, double corrXY)
{
  return ( (sdY * (x1 - x2) * (x1 - x2) / sdX + sdX * (y1 - y2) * (y1 - y2) / sdY - 2 * corrXY * (x1 - x2) * (y1 - y2))/(sqrt(1 - corrXY)) );
}

double norm(double *x, int dim)
{
  double sum = 0;
  for (int i = 0; i < dim; i++)
    sum += x[i] * x[i];
  return sqrt(sum);
}

