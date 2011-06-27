\name{Zpg}
\alias{Zpg}
\alias{as.Zpg}
\alias{as.Zpg.Arma}
\alias{as.Zpg.Ma}
\alias{as.Zpg.Zpg}
\title{ Zero-pole-gain model }
\description{
  Zero-pole-gain model of an ARMA filter.
}
\usage{
Zpg(zero, pole, gain)

\method{as.Zpg}{Arma}(x, \dots)

\method{as.Zpg}{Ma}(x, \dots)

\method{as.Zpg}{Zpg}(x, \dots)

}
\arguments{
  \item{zero}{ complex vector of the zeros of the model.}
  \item{pole}{ complex vector of the poles of the model.}
  \item{gain}{ gain of the model.}
  \item{x}{ model to be converted.}
  \item{\ldots}{ additional arguments (ignored). }
}
\details{
  \code{as.Zpg} converts from other forms, including \code{Arma} and \code{Ma}. 
}
\value{
  An object of class \dQuote{Zpg}, containing the list elements:
  \item{zero}{ complex vector of the zeros of the model.}
  \item{pole}{ complex vector of the poles of the model.}
  \item{gain}{ gain of the model.}
}
\author{ Tom Short }
\seealso{ \code{\link{Arma}}, \code{\link{bilinear}} }
\keyword{ math }
