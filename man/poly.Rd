\name{poly}
\alias{poly}
\title{ Polynomial given roots }
\description{
  Coefficients of a polynomial when roots are given or the
  characteristic polynomial of a matrix.
}
\usage{
poly(x)
}
\arguments{
  \item{x}{ a vector or matrix. For a vector, it specifies the roots of
    the polynomial. For a matrix, the characteristic polynomial is found. }
}
\value{
  An array of the coefficients of the polynomial in order from highest to lowest
  polynomial power.
}
\references{

Octave Forge \url{https://octave.sourceforge.io/}

}
\author{ Original Octave version by Kurt Hornik. Conversion to R by Tom Short. }
\seealso{ \code{\link{polyval}}, \code{\link{roots}}, \code{\link{conv}}
}
\examples{
poly(c(1, -1))
poly(roots(1:3))
poly(matrix(1:9, 3, 3))
}
\keyword{ math }
