\name{remez}
\alias{remez}
\title{ Parks-McClellan optimal FIR filter design }
\description{
  Parks-McClellan optimal FIR filter design.
}
\usage{
remez(n, f, a, w = rep(1.0, length(f) / 2),
      ftype = c('bandpass', 'differentiator', 'hilbert'),
      density = 16)
}
\arguments{
  \item{n}{ order of the filter (1 less than the length of the filter) }
  \item{f}{ frequency at the band edges in the range (0, 1), with 1
    being the Nyquist frequency.}
  \item{a}{ amplitude at the band edges. }
  \item{w}{ weighting applied to each band. }
  \item{ftype}{ options are: \code{'bandpass'}, \code{'differentiator'}, and \code{'hilbert'}. }
  \item{density}{ determines how accurately the filter will be
     constructed. The minimum value is 16, but higher numbers are
     slower to compute.}
}
\value{
  The FIR filter coefficients, an array of \code{length(n+1)}, of class \code{Ma}.
}
\references{
  Rabiner, L. R., McClellan, J. H., and Parks, T. W., \dQuote{FIR Digital Filter
  Design Techniques Using Weighted Chebyshev Approximations}, IEEE Proceedings,
  vol. 63, pp. 595 - 610, 1975.
  
\url{http://en.wikipedia.org/wiki/Fir_filter} 
  
Octave Forge \url{http://octave.sf.net}

}
\author{ Original Octave version by Paul Kienzle. Conversion to R by Tom
  Short. It uses C routines developed by Jake Janovetz.}
\seealso{ \code{\link{filter}}, \code{\link{Ma}},
\code{\link{fftfilt}}, \code{\link{fir1}} }
\examples{
f1 <- remez(15, c(0, 0.3, 0.4, 1), c(1, 1, 0, 0))
freqz(f1)
}
\keyword{ math }
