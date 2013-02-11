\name{roots}
\alias{roots}
\title{Roots of a polynomial}
\description{Roots of a polynomial}
\usage{
roots(x, method = c("polyroot", "eigen"))
}
\arguments{
  \item{x}{Polynomial coefficients with coefficients given in order from highest to lowest
    polynomial power. This is the Matlab/Octave convention; it is
    opposite of the convention used by \code{polyroot}.}
  \item{method}{Either \dQuote{polyroot} (default) which uses \code{\link{polyroot}} for its computations internally 
    (and is typically more accurate) or \dQuote{eigen} which uses eigenvalues of the companion matrix for its computation. 
    The latter returns complex values in case of real valued solutions in less cases.}
}
\value{
  A complex array with the roots of the polynomial.
}
\references{
Octave Forge \url{http://octave.sf.net}
}
\author{Original Octave version by Kurt Hornik. Conversion to R by Tom Short.}
\seealso{\code{\link{polyroot}}, \code{\link{polyval}}, \code{\link{poly}}, \code{\link{conv}}}
\examples{
roots(1:3)
polyroot(3:1) # should be the same
poly(roots(1:3))

roots(1:3, method="eigen") # using eigenvalues
}
\keyword{math}
