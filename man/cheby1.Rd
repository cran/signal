\name{cheby1}
\alias{cheby1}
\alias{cheby1.default}
\alias{cheby1.FilterOfOrder}
\alias{cheby2}
\alias{cheby2.default}
\alias{cheby2.FilterOfOrder}
\title{ Generate a Chebyshev filter. }
\description{
  Generate a Chebyshev type I or type II filter coefficients with specified dB of pass band ripple.
}      
\usage{
\method{cheby1}{default}(n, Rp, W, type = c("low", "high", "stop",
"pass"), plane = c("z", "s"), \ldots)

\method{cheby1}{FilterOfOrder}(n, Rp = n$Rp, W = n$Wc, type = n$type, \ldots)

\method{cheby2}{default}(n, Rp, W, type = c("low", "high", "stop",
"pass"), plane = c("z", "s"), \ldots)

\method{cheby2}{FilterOfOrder}(n, \ldots)

}
\arguments{
  \item{n}{ filter order or generic filter model}
  \item{Rp}{ dB of pass band ripple }
  \item{W}{ critical frequencies of the filter. \code{W} must be a
    scalar for low-pass and high-pass filters, and \code{W} must be a
    two-element vector \code{c(low, high)} specifying the lower and
    upper bands. For digital filters, \code{W} must be between 0 and 1
    where 1 is the Nyquist frequency.}
  \item{type}{ Filter type, one of \code{"low"} for a low-pass filter,
    \code{"high"} for a high-pass filter, \code{"stop"} for a stop-band (band-reject)
    filter, or \code{"pass"} for a pass-band filter. }
  \item{plane}{ \code{"z"} for a digital filter or \code{"s"} for an
    analog filter. }
  \item{\dots}{ additional arguments passed to \code{cheby1} or \code{cheby2},
    overriding those given by \code{n} of class \code{FilterOfOrder}. }
}
\details{
  Because \code{cheby1} and \code{cheby2} are generic, they can be extended to accept other
  inputs, using \code{"cheb1ord"} to generate filter criteria for example.
}
\value{
  An \code{Arma} object with list elements:
  \item{b}{ moving average (MA) polynomial coefficients }
  \item{a}{ autoregressive (AR) polynomial coefficients }
  For \code{cheby1}, the ARMA model specifies a type-I Chebyshev filter,
  and for \code{cheby2}, a type-II Chebyshev filter.
}
\references{ Parks & Burrus (1987). \emph{Digital Filter Design}. New York: John Wiley & Sons, Inc.

  \url{http://en.wikipedia.org/wiki/Chebyshev_filter}
  
Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@user.sf.net}. Modified by Doug Stewart. Conversion to R by Tom Short. }
\seealso{ \code{\link{Arma}}, \code{\link{filter}}, \code{\link{butter}},
  \code{\link{ellip}}, and \code{\link{cheb1ord}}}

\examples{
  # compare the frequency responses of 5th-order Butterworth and Chebyshev filters.
  bf <- butter(5, 0.1)
  cf <- cheby1(5, 3, 0.1)
  bfr <- freqz(bf)
  cfr <- freqz(cf)
  plot(bfr$f/pi, 20 * log10(abs(bfr$h)), type = "l", ylim = c(-40, 0),
       xlim = c(0, .5), xlab = "Frequency", ylab = c("dB"))
  lines(cfr$f/pi, 20 * log10(abs(cfr$h)), col = "red")
  # compare type I and type II Chebyshev filters.
  c1fr <- freqz(cheby1(5, .5, 0.5))
  c2fr <- freqz(cheby2(5, 20, 0.5))
  plot(c1fr$f/pi, abs(c1fr$h), type = "l", ylim = c(0, 1),
       xlab = "Frequency", ylab = c("Magnitude"))
  lines(c2fr$f/pi, abs(c2fr$h), col = "red")
}
\keyword{ math }
