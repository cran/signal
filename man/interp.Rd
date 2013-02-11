\name{interp}
\alias{interp}
\title{ Interpolate / Increase the sample rate }
\description{
  Upsample a signal by a constant factor by using an FIR filter to
  interpolate between points.
}
\usage{
interp(x, q, n = 4, Wc = 0.5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ the signal to be upsampled. }
  \item{q}{ the integer factor to increase the sampling rate by. }
  \item{n}{ the FIR filter length. }
  \item{Wc}{ the FIR filter cutoff frequency. }
}
\details{
It uses an order \code{2*q*n+1} FIR filter to interpolate between samples.
}
\value{
  The upsampled signal, an array of length \code{q * length(x)}.
}
\references{ 

  \url{http://en.wikipedia.org/wiki/Upsampling}

  Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{fir1}}, \code{\link{resample}}, \code{\link{interp1}}, \code{\link{decimate}} }
\examples{
# The graph shows interpolated signal following through the
# sample points of the original signal.
t <- seq(0, 2, by = 0.01)
x <- chirp(t, 2, 0.5, 10, 'quadratic') + sin(2*pi*t*0.4)
y <- interp(x[seq(1, length(x), by = 4)], 4, 4, 1) # interpolate a sub-sample
plot(t, x, type = "l")
idx <- seq(1,length(t),by = 4)
lines(t, y[1:length(t)], col = "blue")
points(t[idx], y[idx], col = "blue", pch = 19)
}
\keyword{ math }
