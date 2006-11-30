\name{zplane}
\alias{zplane}
\alias{zplane.default}
\alias{zplane.Arma}
\alias{zplane.Ma}
\alias{zplane.Zpg}

\title{ Pole-zero plot }
\description{
Plot the poles and zeros of a model or filter.
}
\usage{
\method{zplane}{default}(filt, a, \ldots)

\method{zplane}{Arma}(filt, \ldots)

\method{zplane}{Ma}(filt, \ldots)

\method{zplane}{Zpg}(filt, \ldots)
}
\arguments{
  \item{filt}{ for the default case, the moving-average coefficients of
    an ARMA model or filter. Generically, \code{filt}
    specifies an arbitrary model or filter operation.}
  \item{a}{ the autoregressive (recursive) coefficients of an ARMA filter. }
  \item{\dots}{ Additional arguments passed to \code{plot}. }
}
\details{
  Poles are marked with an `x', and zeros are marked with an `o'.
}
\value{
  No value is returned.
}
\references{
  Octave Forge \url{http://octave.sf.net}

  \url{http://en.wikipedia.org/wiki/Pole-zero_plot}
}
\author{ Tom Short }
\seealso{ \code{\link{Arma}}, \code{\link{freqz}} }
\examples{
filt <- ellip(5, 0.5, 20, .2)
zplane(filt)
}
\keyword{ math }
