\name{decimate}
\alias{decimate}
\title{ Decimate or downsample a signal }
\description{
Downsample a signal by a factor, using an FIR or IIR filter.  
}
\usage{
decimate(x, q, n = if (ftype == "iir") 8 else 30, ftype = "iir")
}
\arguments{
  \item{x}{ signal to be decimated. }
  \item{q}{ integer factor to downsample by. }
  \item{n}{ filter order used in the downsampling. }
  \item{ftype}{ filter type, \code{"iir"} or \code{"fir"} }
}
\details{
 By default, an order 8 Chebyshev type I
filter is used or a 30-point FIR filter if \code{ftype} is \code{'fir'}.  Note
that \code{q} must be an integer for this rate change method.

Makes use of the \code{\link{filtfilt}} function with all its limitations.
}
\value{
  The decimated signal, an array of length \code{ceiling(length(x) / q)}.
}
\references{ 
Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{filter}}, \code{\link{resample}}, \code{\link{interp}} }
\examples{
# The signal to decimate starts away from zero, is slowly varying
# at the start and quickly varying at the end, decimate and plot.
# Since it starts away from zero, you will see the boundary
# effects of the antialiasing filter clearly.  You will also see
# how it follows the curve nicely in the slowly varying early
# part of the signal, but averages the curve in the quickly
# varying late part of the signal.
t <- seq(0, 2, by = 0.01)
x <- chirp(t, 2, 0.5, 10, 'quadratic') + sin(2*pi*t*0.4)
y <- decimate(x, 4)   # factor of 4 decimation
plot(t, x, type = "l")
lines(t[seq(1,length(t), by = 4)], y, col = "blue")
}
\keyword{ math }
