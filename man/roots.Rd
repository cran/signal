\name{roots}
\alias{roots}
\title{ Roots of a polynomial }
\description{
  Roots of a polynomial
}
\usage{
roots(x)
}
\arguments{
  \item{x}{ polynomial coefficients with coefficients given in order from highest to lowest
    polynomial power. This is the Matlab/Octave convention; it is
    opposite of the convention used by \code{polyroot}.}
}
\value{
  A complex array with the roots of the polynomial.
}
\references{

Octave Forge \url{http://octave.sf.net}

}
\author{ Original Octave version by Kurt Hornik. Conversion to R by Tom Short. }
\seealso{ \code{\link{polyroot}}, \code{\link{polyval}},
  \code{\link{poly}}, \code{\link{conv}}
}
\examples{
roots(1:3)
polyroot(3:1) # should be the same
poly(roots(1:3))
}
\keyword{ math }
