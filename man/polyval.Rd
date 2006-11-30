\name{polyval}
\alias{polyval}
\title{ Evaluate a polynomial }
\description{
  Evaluate a polynomial at given points.
}
\usage{
polyval(coef, z)
}
\arguments{
  \item{coef}{ coefficients of the polynomial, defined in decreasing power. }
  \item{z}{ the points at which to evaluate the polynomial. }
}
\value{
  An array of \code{length(z)}, the polynomial evaluated at each element
  of \code{z}.
}
\author{ Tom Short }
\seealso{ \code{\link{poly}}, \code{\link{roots}}
}
\examples{
polyval(c(1,0,-2), 1:3)  # s^2 - 2 
}
\keyword{ math }
