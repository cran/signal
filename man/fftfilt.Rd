\name{fftfilt}
\alias{fftfilt}
\alias{filter.FftFilter}
\alias{FftFilter}
\title{ Filters with an FIR filter using the FFT }
\description{
  Filters with an FIR filter using the FFT.
}
\usage{
fftfilt(b, x, n = NULL)

FftFilter(b, n)

\method{filter}{FftFilter}(filt, x, \ldots)

}
\arguments{
  \item{b}{ the moving-average (MA) coefficients of
    an FIR filter.}
  \item{x}{ the input signal to be filtered. }
  \item{n}{ if given, the length of the FFT window for the overlap-add method. }
  \item{filt}{ filter to apply to the signal.}
  \item{\ldots}{ additional arguments (ignored). }
}
\details{
If \code{n} is not specified explicitly, we do not use the overlap-add
method at all because loops are really slow. Otherwise, we only
ensure that the number of points in the FFT is the smallest power
of two larger than \code{n} and \code{length(b)}.}
\value{
  For \code{fftfilt}, the filtered signal, the same length as the input
  signal \code{x}.

  For \code{FftFilter}, a filter of class \code{FftFilter} that can be
  used with \code{filter}.
}
\references{ 
Octave Forge \url{https://octave.sourceforge.io/}
}
\author{ Original Octave version by Kurt Hornik and John W. Eaton.
 Conversion to R by Tom Short. }
\seealso{ \code{\link{Ma}}, \code{\link{filter}}, \code{\link{fft}}, \code{\link{filtfilt}} }
\examples{
t <- seq(0, 1, len = 100)                     # 1 second sample
x <- sin(2*pi*t*2.3) + 0.25*rnorm(length(t))  # 2.3 Hz sinusoid+noise
z <- fftfilt(rep(1, 10)/10, x) # apply 10-point averaging filter
plot(t, x, type = "l")
lines(t, z, col = "red")

}
\keyword{ math }
