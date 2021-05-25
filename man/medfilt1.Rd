\name{medfilt1}
\alias{medfilt1}
\alias{MedianFilter}
\alias{filter.MedianFilter}
\title{ Median filter }
\description{
  Deprecated! Performs an n-point running median. For Matlab/Octave compatibility.
}
\usage{
medfilt1(x, n = 3, \dots)

MedianFilter(n = 3)

\method{filter}{MedianFilter}(filt, x, \dots)
}
\arguments{
  \item{x}{ signal to be filtered. }
  \item{n}{ size of window on which to perform the median.  }
  \item{filt}{ filter to apply to the signal. }
  \item{\dots}{ additional arguments passed to \code{runmed}. }
}
\details{
  \code{medfilt1} is a wrapper for \code{runmed}.
}
\value{
  For \code{medfilt1}, the filtered signal of
  \code{length(x)}.

  For \code{MedianFilter}, a class of \dQuote{MedianFilter} that can be used
  with \code{filter} to apply a median filter to a signal.
}
\references{
  \url{https://en.wikipedia.org/wiki/Median_filter}
  
  Octave Forge \url{https://octave.sourceforge.io/}
}
\author{ Tom Short. }
\seealso{ \code{\link{runmed}}, \code{\link{median}}, \code{\link{filter}} }
\examples{
t <- seq(0, 1, len=100)                            # 1 second sample
x <- sin(2*pi*t*2.3) + 0.25*rlnorm(length(t), 0.5) # 2.3 Hz sinusoid+noise
plot(t, x, type = "l")
# 3-point filter
lines(t, medfilt1(x), col="red", lwd=2) 
# 7-point filter
lines(t, filter(MedianFilter(7), x), col = "blue", lwd=2) # another way to call it
}
\keyword{ math }
