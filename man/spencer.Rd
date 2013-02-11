\name{spencer}
\alias{spencer}
\alias{spencerFilter}
\title{ Spencer filter }
\description{
  Spencer's 15-point moving average filter.
}
\usage{
spencer(x)

spencerFilter()
}
\arguments{
  \item{x}{ signal to be filtered. }
}
\value{
  For \code{spencer}, the filtered signal. For \code{spencerFilter}, a
  vector of filter coefficients with class \code{Ma} that can be passed
  to \code{filter}.
}
\references{ 
  Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Friedrich Leisch. Conversion to R by Tom Short. }

\seealso{ \code{\link{filter}}, \code{\link{Ma}}}
\keyword{ math }
