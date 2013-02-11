\name{ellip}
\alias{ellip}
\alias{ellip.default}
\alias{ellip.FilterOfOrder}
\title{ Elliptic or Cauer filter }
\description{
  Generate an Elliptic or Cauer filter (discrete and continuous).
}
\usage{
\method{ellip}{default}(n, Rp, Rs, W, type = c("low", "high", "stop",
"pass"), plane = c("z", "s"), \ldots)

\method{ellip}{FilterOfOrder}(n, Rp = n$Rp, Rs = n$Rs, W = n$Wc, type = n$type, \ldots)

}
\arguments{
  \item{n}{ filter order or generic filter model}
  \item{Rp}{ dB of pass band ripple }
  \item{Rs}{ dB of stop band ripple }
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
  \item{\dots}{ additional arguments passed to \code{ellip},
    overriding those given by \code{n} of class \code{FilterOfOrder}. }
}
\details{
  Because \code{ellip} is generic, it can be extended to accept other
  inputs, using \code{"ellipord"} to generate filter criteria for example.
}
\value{
  An \code{Arma} object with list elements:
  \item{b}{ moving average (MA) polynomial coefficients }
  \item{a}{ autoregressive (AR) polynomial coefficients }
}
\references{ Oppenheim, Alan V., \emph{Discrete Time Signal Processing},
  Hardcover, 1999.
  
Parente Ribeiro, E., Notas de aula da disciplina TE498 -  Processamento 
Digital de Sinais, UFPR, 2001/2002.

\url{http://en.wikipedia.org/wiki/Elliptic_filter}

Octave Forge \url{http://octave.sf.net}

}
\author{ Original Octave version by Paulo Neis
  \email{p_neis@yahoo.com.br}.
  Modified by Doug Stewart. Conversion to R by Tom Short. }
\seealso{ \code{\link{Arma}}, \code{\link{filter}}, \code{\link{butter}},
  \code{\link{cheby1}}, and \code{\link{ellipord}}}

\examples{
  # compare the frequency responses of 5th-order Butterworth and elliptic filters.
  bf <- butter(5, 0.1)
  ef <- ellip(5, 3, 40, 0.1)
  bfr <- freqz(bf)
  efr <- freqz(ef)
  plot(bfr$f, 20 * log10(abs(bfr$h)), type = "l", ylim = c(-50, 0),
       xlab = "Frequency, radians", ylab = c("dB"))
  lines(efr$f, 20 * log10(abs(efr$h)), col = "red")
}
\keyword{ math }
