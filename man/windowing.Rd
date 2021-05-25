\name{Windowing functions}
\alias{bartlett}
\alias{blackman}
\alias{boxcar}
\alias{flattopwin}
\alias{gausswin}
\alias{hamming}
\alias{hanning}
\alias{triang}
\title{ Windowing functions }

\description{
  
A variety of generally Matlab/Octave compatible filter generation
functions, including Bartlett, Blackman, Hamming, Hanning, and
triangular.
}

\usage{
bartlett(n) 
blackman(n) 
boxcar(n) 
flattopwin(n, sym = c('symmetric', 'periodic')) 
gausswin(n, w = 2.5) 
hamming(n) 
hanning(n) 
triang(n)
}
\arguments{
  \item{n}{ length of the filter; number of coefficients to generate. }
  \item{w}{ the reciprocal of the standard deviation for
    \code{gausswin}. Use larger \code{a} for a narrower window. }
  \item{sym}{ \code{'symmetric'} for a symmetric window, \code{'periodic'} for a
    periodic window. }
}
\details{
  
\code{triang}, unlike the bartlett window, does not go to zero at the
edges of the window.  For odd \code{n}, \code{triang(n)} is equal to
\code{bartlett(n+2)} except for the zeros at the edges of the window.

A main use of \code{flattopwin} is for calibration, due
to its negligible amplitude errors. This window has low pass-band ripple, but high bandwidth. 

}
\value{
  Filter coefficients.
}
\references{      
     Oppenheim, A.V., and Schafer, R.W., \emph{Discrete-Time Signal Processing}, Upper Saddle River, NJ: Prentice-Hall, 1999.

Gade, S., Herlufsen, H. (1987) \dQuote{Use of weighting functions in DFT/FFT
analysis (Part I)}, \emph{Bruel & Kjaer Technical Review} No. 3.

\url{https://en.wikipedia.org/wiki/Windowed_frame}

Octave Forge \url{https://octave.sourceforge.io/}
}
\author{ Original Octave versions by Paul Kienzle (\code{boxcar},
  \code{gausswin}, \code{triang}) and Andreas Weingessel
  (\code{bartlett}, \code{blackman}, \code{hamming}, \code{hanning}).
  Conversion to R by Tom Short. }
\seealso{ \code{\link{filter}}, \code{\link{fftfilt}},
  \code{\link{filtfilt}}, \code{\link{fir1}}  }
\examples{
n <- 51
op <- par(mfrow = c(3,3))
plot(bartlett(n), type = "l", ylim = c(0,1))
plot(blackman(n), type = "l", ylim = c(0,1))
plot(boxcar(n), type = "l", ylim = c(0,1))
plot(flattopwin(n), type = "l", ylim = c(0,1))
plot(gausswin(n, 5), type = "l", ylim = c(0,1))
plot(hanning(n), type = "l", ylim = c(0,1))
plot(hamming(n), type = "l", ylim = c(0,1))
plot(triang(n), type = "l", ylim = c(0,1))
par(op)
}
\keyword{ math }
