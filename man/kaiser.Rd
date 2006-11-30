\name{kaiser}
\alias{kaiser}
\title{ Kaiser window }
\description{
Returns the filter coefficients of the n-point Kaiser window with
parameter beta.
}
\usage{
kaiser(n, beta)
}
\arguments{
  \item{n}{ filter order. }
  \item{beta}{ bessel shape parameter; larger \code{beta} gives narrower
    windows.  }
}
\value{
  An array of filter coefficients of \code{length(n)}.
}
\references{
  Oppenheim, A. V.; Schafer, R. W.; and Buck J. R. (1999). Discrete-time signal processing. Upper Saddle River, N.J.: Prentice Hall.

  \url{http://en.wikipedia.org/wiki/Kaiser_window}

  Octave Forge \url{http://octave.sf.net}
 }
\author{ Original Octave version by Kurt Hornik. Conversion to R by Tom Short. }
\seealso{ \code{\link{hamming}}, \code{\link{kaiserord}} }
\examples{
plot(kaiser(101, 2), type = "l", ylim = c(0,1))
lines(kaiser(101, 10), col = "blue")
lines(kaiser(101, 50), col = "green")
}
\keyword{ math  }
