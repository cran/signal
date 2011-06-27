\name{FilterOfOrder}
\alias{FilterOfOrder}
\title{ Filter of given order and specifications. }
\description{
  IIR filter specifications, including order, frequency cutoff, type, and possibly
  others.
}
\usage{
FilterOfOrder(n, Wc, type, \dots)
}
\arguments{
  \item{n}{ filter order }
  \item{Wc}{ cutoff frequency }
  \item{type}{ filter type, normally one of \code{"low"}, \code{"high"}, \code{"stop"}, or \code{"pass"} }
  \item{\dots}{ other filter description characteristics, possibly
    including \code{Rp} for dB of pass band ripple or \code{Rs} for dB
    of stop band ripple, depending on filter type (Chebyshev, etc.). }
}
\details{
  The filter is 
}
\value{
  A list of class \code{FilterOfOrder} with the following elements
  (repeats of the input arguments):
  \item{n}{ filter order }
  \item{Wc}{ cutoff frequency }
  \item{type}{ filter type, normally one of \code{"low"}, \code{"high"}, \code{"stop"}, or \code{"pass"} }
  \item{\dots}{ other filter description characteristics, possibly
    including \code{Rp} for dB of pass band ripple or \code{Rs} for dB
    of stop band ripple, depending on filter type (Chebyshev, etc.). }
}
\references{
  Octave Forge \url{http://octave.sf.net}
}
\author{ Tom Short }
\seealso{ \code{\link{filter}}, \code{\link{butter}} and \code{\link{buttord}}
  \code{\link{cheby1}} and \code{\link{cheb1ord}}, and
  \code{\link{ellip}} and \code{\link{ellipord}}}
\keyword{ math }
