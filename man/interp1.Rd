\name{interp1}
\alias{interp1}
\title{ Interpolation }
\description{
  Interpolation methods, including linear, spline, and cubic interpolation.
}
\usage{
interp1(x, y, xi, method = c("linear", "nearest", "pchip", "cubic", "spline"), 
        extrap = NA, \ldots)
}
\arguments{
  \item{x,y}{ vectors giving the coordinates of the points to be
          interpolated. \code{x} is assumed to be strictly monotonic.}
  \item{xi}{ points at which to interpolate. }
  \item{method}{ one of \code{"linear"}, \code{"nearest"}, \code{"pchip"}, \code{"cubic"}, \code{"spline"}. }
  \item{extrap}{ if \code{TRUE} or \code{'extrap'}, then extrapolate values beyond
     the endpoints. If \code{extrap} is a number, replace values beyond the
     endpoints with that number (defaults to \code{NA}).  }
  \item{\ldots}{ for \code{method='spline'}, additional arguments passed to \code{splinefun}. }
}
\details{

  The following methods of interpolation are available:

  \code{'nearest'}: return nearest neighbour

  \code{'linear'}: linear interpolation from nearest neighbours

  \code{'pchip'}: piecewise cubic hermite interpolating polynomial

  \code{'cubic'}: cubic interpolation from four nearest neighbours

  \code{'spline'}: cubic spline interpolation--smooth first and second
           derivatives throughout the curve

}
\value{
  The interpolated signal, an array of \code{length(xi)}.
}
\references{ 
Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{approx}}, \code{\link{filter}},
  \code{\link{resample}}, \code{\link{interp}}, \code{\link{spline}}  }
\examples{
xf <- seq(0, 11, length=500)
yf <- sin(2*pi*xf/5)
#xp <- c(0:1,3:10)
#yp <- sin(2*pi*xp/5)
xp <- c(0:10)
yp <- sin(2*pi*xp/5)
extrap <- TRUE
lin  <- interp1(xp, yp, xf, 'linear', extrap = extrap)
spl  <- interp1(xp, yp, xf, 'spline', extrap = extrap)
pch  <- interp1(xp, yp, xf, 'pchip', extrap = extrap)
cub  <- interp1(xp, yp, xf, 'cubic', extrap = extrap)
near <- interp1(xp, yp, xf, 'nearest', extrap = extrap)
plot(xp, yp, xlim = c(0, 11))
lines(xf, lin, col = "red")
lines(xf, spl, col = "green")
lines(xf, pch, col = "orange")
lines(xf, cub, col = "blue")
lines(xf, near, col = "purple")
}
\keyword{ math }
