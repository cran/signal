\name{pchip}
\alias{pchip}
\title{ Piecewise cubic hermite interpolation }
\description{
  Piecewise cubic hermite interpolation.
}
\usage{
pchip(x, y, xi = NULL)
}
\arguments{
  \item{x,y}{ vectors giving the coordinates of the points to be
    interpolated. \code{x} must be strictly monotonic
  (either increasing or decreasing).}

  \item{xi}{ points at which to interpolate. }
}
\details{

In contrast to \code{spline}, \code{pchip} preserves the monotonicity of
\code{x} and \code{y}.

}
\value{
  Normally, the interpolated signal, an array of \code{length(xi)}.

  if \code{xi == NULL}, a list of class \code{pp}, a piecewise
  polynomial representation with the following elements:

  \item{x}{ breaks between intervals. }
  \item{P}{ a matrix with \code{n} times \code{d} rows and \code{k}
    columns. The ith row of \code{P}, \code{P[i,]}, contains the coefficients 
    for the polynomial over the ith interval, ordered from highest to 
    lowest. There must be one row for each interval in x. }
  \item{n}{ number of intervals (\code{length(x) - 1}). }
  \item{k}{ polynomial order. }
  \item{d}{ number of polynomials. }

}
\references{
  Fritsch, F. N. and Carlson, R. E., "Monotone Piecewise Cubic
  Interpolation," SIAM Journal of Numerical Analysis, vol. 17, pp.238-246, 1980.
  
  Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{approx}}, \code{\link{spline}}, \code{\link{interp1}}  }
\examples{
xf = linspace(0,11,500); yf = sin(2*pi*xf/5)
xp = c(0:10); yp = sin(2*pi*xp/5)
pch  = pchip(xp, yp, xf)
plot(xp, yp, xlim=c(0,11))
lines(xf, pch, col = "orange")
}
\keyword{ math }
