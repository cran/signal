\name{fir1}
\alias{fir1}
\title{ FIR filter generation }
\description{
  FIR filter coefficients for a filter with the given order and frequency cutoff.
}
\usage{
fir1(n, w, type = c("low", "high", "stop", "pass", "DC-0", "DC-1"), window = hamming(n + 1), scale = TRUE)
}
\arguments{
  \item{n}{ order of the filter (1 less than the length of the filter) }
  \item{w}{ band edges, strictly increasing vector in the range [0,
    1], where 1 is the Nyquist frequency. A scalar for highpass or
    lowpass filters, a vector pair for
    bandpass or bandstop, or a vector for an alternating pass/stop filter. }
  \item{type}{ character specifying filter type, one of \code{"low"} for a low-pass filter,
    \code{"high"} for a high-pass filter, \code{"stop"} for a stop-band (band-reject)
    filter, \code{"pass"} for a pass-band filter, \code{"DC-0"} for a
    bandpass as the first band of a multiband filter, or \code{"DC-1"} for a
    bandstop as the first band of a multiband filter. }
  \item{window}{ smoothing window. The returned filter is the same shape as the smoothing window. }
  \item{scale}{ whether to normalize or not. Use \code{TRUE} or \code{'scale'} to set
    the magnitude of the center of the first passband to 1, and
    \code{FALSE} or \code{'noscale'} to not normalize.}
}
\details{
}
\value{
  The FIR filter coefficients, an array of length(n+1), of class \code{Ma}.
}
\references{

\url{http://en.wikipedia.org/wiki/Fir_filter} 
  
Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle,
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{filter}}, \code{\link{Ma}},
\code{\link{fftfilt}}, \code{\link{fir2}} }
\examples{
freqz(fir1(40,0.3))
freqz(fir1(10,c(0.3, .5), "stop"))
freqz(fir1(10,c(0.3, .5), "pass"))
}
\keyword{ math }
