\name{butter}
\alias{butter}
\alias{butter.default}
\alias{butter.FilterOfOrder}
\title{ Generate a Butterworth filter. }
\description{
  Generate Butterworth filter polynomial coefficients.
}      
\usage{
\method{butter}{default}(n, W, type = c("low", "high", "stop", "pass"),
plane = c("z", "s"), \ldots)

\method{butter}{FilterOfOrder}(n, \ldots)
}
\arguments{
  \item{n}{ filter order or generic filter model}
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
  \item{\dots}{ additional arguments passed to \code{butter},
    overriding those given by \code{n} of class \code{FilterOfOrder}. }
}
\details{
  Because \code{butter} is generic, it can be extended to accept other
  inputs, using \code{"buttord"} to generate filter criteria for example.
}
\value{
  An \code{Arma} object with list elements:
  \item{b}{ moving average (MA) polynomial coefficients }
  \item{a}{ autoregressive (AR) polynomial coefficients }
}
\references{ Proakis & Manolakis (1992). \emph{Digital Signal Processing}. New
  York: Macmillan Publishing Company.

  \url{https://en.wikipedia.org/wiki/Butterworth_filter}
  
Octave Forge \url{https://octave.sourceforge.io/}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@user.sf.net}. Modified by Doug Stewart. Conversion to R by Tom Short. }
\seealso{ \code{\link{Arma}}, \code{\link{filter}}, \code{\link{cheby1}},
  \code{\link{ellip}}, and \code{\link{buttord}}}
\examples{
  bf <- butter(4, 0.1)
  freqz(bf)
  zplane(bf)
}
\keyword{ math }
