\name{fir2}
\alias{fir2}
\title{ FIR filter generation }
\description{
  FIR filter coefficients for a filter with the given order and frequency cutoffs.
}
\usage{
fir2(n, f, m, grid_n = 512, ramp_n = grid_n/20, window = hamming(n + 1))
}
\arguments{
  \item{n}{ order of the filter (1 less than the length of the filter) }
  \item{f}{ band edges, strictly increasing vector in the range [0,
    1] where 1 is the Nyquist frequency. The first element must be 0 and
    the last element must be 1.
    If elements are identical, it indicates a jump in frequency response. }
  \item{m}{ magnitude at band edges, a vector of \code{length(f)}. }
  \item{grid_n}{ length of ideal frequency response function
    defaults to 512, should be a power of 2 bigger than \code{n}. }
  \item{ramp_n}{ transition width for jumps in filter response
    defaults to \code{grid_n/20}. A wider ramp gives wider transitions
    but has better stopband characteristics. }
  \item{window}{ smoothing window. The returned filter is the same shape as the smoothing window. }
}
\value{
  The FIR filter coefficients, an array of length(n+1), of class \code{Ma}.
}
\references{ 
Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle,
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{filter}}, \code{\link{Ma}},
\code{\link{fftfilt}}, \code{\link{fir1}} }
\examples{
f <- c(0, 0.3, 0.3, 0.6, 0.6, 1)
m <- c(0, 0, 1, 1/2, 0, 0)
fh <- freqz(fir2(100, f, m))
op <- par(mfrow = c(1, 2))
plot(f, m, type = "b", ylab = "magnitude", xlab = "Frequency")
lines(fh$f / pi, abs(fh$h), col = "blue")
# plot in dB:
plot(f, 20*log10(m+1e-5), type = "b", ylab = "dB", xlab = "Frequency")
lines(fh$f / pi, 20*log10(abs(fh$h)), col = "blue")
par(op)
}
\keyword{ math }
