\name{filtfilt}
\alias{filtfilt}
\alias{filtfilt.default}
\alias{filtfilt.Arma}
\alias{filtfilt.Ma}
\alias{filtfilt.Zpg}
\title{ Forward and reverse filter a signal }
\description{
  Using two passes, forward and reverse filter a signal.
}
\usage{
\method{filtfilt}{default}(filt, a, x, \ldots)

\method{filtfilt}{Arma}(filt, x, \ldots)

\method{filtfilt}{Ma}(filt, x, \ldots)

\method{filtfilt}{Zpg}(filt, x, \ldots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filt}{ For the default case, the moving-average coefficients of
    an ARMA filter (normally called \sQuote{b}). Generically, \code{filt}
    specifies an arbitrary filter operation.}
  \item{a}{ the autoregressive (recursive) coefficients of an ARMA filter. }
  \item{x}{ the input signal to be filtered. }
  \item{\ldots}{ additional arguments (ignored). }
}
\details{
 This corrects for phase
 distortion introduced by a one-pass filter, though it does square the
 magnitude response in the process. That's the theory at least.  In
 practice the phase correction is not perfect, and magnitude response
 is distorted, particularly in the stop band.

 In this version, we zero-pad the end of the signal to give the reverse
 filter time to ramp up to the level at the end of the signal.
 Unfortunately, the degree of padding required is dependent on the
 nature of the filter and not just its order, so this function needs
 some work yet - and is in the state of the year 2000 version of the Octave code.

 Since \code{filtfilt} is generic, it can be extended to call other filter types.
}
\value{
  The filtered signal, normally the same length as the input signal \code{x}.
}
\references{ 
Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle,
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{filter}}, \code{\link{Arma}},
\code{\link{fftfilt}}}
\examples{
bf <- butter(3, 0.1)                        # 10 Hz low-pass filter
t <- seq(0, 1, len = 100)                   # 1 second sample
x <- sin(2*pi*t*2.3) + 0.25*rnorm(length(t))# 2.3 Hz sinusoid+noise
y <- filtfilt(bf, x)
z <- filter(bf, x) # apply filter
plot(t, x)
points(t, y, col="red")
points(t, z, col="blue")
legend("bottomleft", legend = c("data", "filtfilt", "filter"), 
       pch = 1, col = c("black", "red", "blue"), bty = "n")
}
\keyword{ math }
