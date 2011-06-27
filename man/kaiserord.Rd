\name{kaiserord}
\alias{kaiserord}
\title{ Parameters for an FIR filter from a Kaiser window }
\description{
  Returns the parameters needed for fir1 to produce a filter of the
  desired specification from a Kaiser window.
}
\usage{
kaiserord(f, m, dev, Fs = 2)
}
\arguments{
  \item{f}{ frequency bands, given as pairs, with the first half of the
    first pair assumed to start at 0 and the last half of the last
    pair assumed to end at 1.  It is important to separate the
    band edges, since narrow transition regions require large order
    filters. }
  \item{m}{ magnitude within each band.  Should be non-zero for pass band
    and zero for stop band.  All passbands must have the same
    magnitude, or you will get the error that pass and stop bands
    must be strictly alternating. }
  \item{dev}{ deviation within each band.  Since all bands in the resulting
    filter have the same deviation, only the minimum deviation is
    used.  In this version, a single scalar will work just as well. }
  \item{Fs}{ sampling rate.  Used to convert the frequency specification into
    the [0, 1], where 1 corresponds to the Nyquist frequency, Fs/2. }
}
\value{
  An object of class \code{FilterOfOrder} with the following list elements:
  \item{n}{ filter order }
  \item{Wc}{ cutoff frequency }
  \item{type}{ filter type, one of \code{"low"}, \code{"high"}, \code{"stop"}, \code{"pass"},
    \code{"DC-0"}, or \code{"DC-1"} }
  \item{beta}{ shape parameter }
}
\references{
  Oppenheim, A. V., Schafer, R. W., and Buck, J. R. (1999). 
    \emph{Discrete-time signal processing}. Upper Saddle River, N.J.: Prentice Hall.

  \url{http://en.wikipedia.org/wiki/Kaiser_window}

  Octave Forge \url{http://octave.sf.net}
 }
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@users.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{hamming}}, \code{\link{kaiser}} }
\examples{
Fs <- 11025
op <- par(mfrow = c(2, 2), mar = c(3, 3, 1, 1))
for (i in 1:4) {
  switch(i,
    "1" = {
        bands <- c(1200, 1500)
        mag <- c(1, 0)
        dev <- c(0.1, 0.1)
    },
    "2" = {
        bands <- c(1000, 1500)
        mag <- c(0, 1)
        dev <- c(0.1, 0.1)
    },
    "3" = {
        bands <- c(1000, 1200, 3000, 3500)
        mag <- c(0, 1, 0)
        dev <- 0.1
    },
    "4" = {
        bands <- 100 * c(10, 13, 15, 20, 30, 33, 35, 40)
        mag <- c(1, 0, 1, 0, 1)
        dev <- 0.05
    })
}

  kaisprm <- kaiserord(bands, mag, dev, Fs)
  with(kaisprm, {
    d <<- max(1, trunc(n/10))
    if (mag[length(mag)]==1 && (d \%\% 2) == 1)
      d <<- d+1
    f1 <<- freqz(fir1(n, Wc, type, kaiser(n+1, beta), 'noscale'), 
        Fs = Fs)
    f2 <<- freqz(fir1(n-d, Wc, type, kaiser(n-d+1, beta), 'noscale'), 
        Fs = Fs)
  })                                                               
  plot(f1$f,abs(f1$h), col = "blue", type = "l", 
       xlab = "", ylab = "")
  lines(f2$f,abs(f2$h), col = "red")
  legend("right", paste("order", c(kaisprm$n-d, kaisprm$n)), 
         col = c("red", "blue"), lty = 1, bty = "n")
  b <- c(0, bands, Fs/2)
  for (i in seq(2, length(b), by=2)) {
    hi <- mag[i/2] + dev[1]
    lo <- max(mag[i/2] - dev[1], 0)
    lines(c(b[i-1], b[i], b[i], b[i-1], b[i-1]), c(hi, hi, lo, lo, hi))
  }
par(op)
}
\keyword{ math }
