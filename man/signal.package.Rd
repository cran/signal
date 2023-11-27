\name{signal-package}
\alias{signal-package}
\alias{signal}
\docType{package}
\encoding{latin1}
\title{
Signal processing 
}
\description{
A set of generally Matlab/Octave-compatible signal processing
functions. Includes filter generation utilities, filtering functions,
resampling routines, and visualization of filter models. It also
includes interpolation functions and some Matlab compatibility
functions.
}
\details{
The main routines are:

\emph{Filtering:} filter, fftfilt, filtfilt, medfilt1, sgolay, sgolayfilt

\emph{Resampling:} interp, resample, decimate

\emph{IIR filter design:} bilinear, butter, buttord, cheb1ord, cheb2ord,
cheby1, cheby2, ellip, ellipord, sftrans

\emph{FIR filter design:} fir1, fir2, remez, kaiserord, spencer

\emph{Interpolation:} interp1, pchip

\emph{Compatibility routines and utilities:} ifft, sinc,
postpad, chirp, poly, polyval

\emph{Windowing:} bartlett, blackman, boxcar, flattopwin, gausswin,
hamming, hanning, triang

\emph{Analysis and visualization:} freqs, freqz, impz, zplane, grpdelay, specgram

Most of the functions accept Matlab-compatible argument lists, but many
are generic functions and can accept simpler argument lists.

For a complete list, use \code{library(help="signal")}.
}
\author{

Most of these routines were translated from Octave Forge routines. The
main credit goes to the original Octave authors:

  Paul Kienzle, John W. Eaton, Kurt Hornik, Andreas Weingessel, Kai
  Habel, Julius O. Smith III, Bill Lash, André Carezia, Paulo Neis,
  David Billinghurst, Friedrich Leisch

  Translations by Tom Short \email{tshort@eprisolutions.com} 
  (who maintained the package until 2009).
  
  Current maintainer is Uwe Ligges \email{ligges@statistik.tu-dortmund.de}.
}
\references{
  \url{https://en.wikipedia.org/wiki/Category:Signal_processing}

  Octave Forge \url{https://octave.sourceforge.io/}

  Package \code{\link[matlab:matlab-package]{matlab}} by P. Roebuck

  For Matlab/Octave conversion and compatibility, see \url{https://mathesaurus.sourceforge.net/octave-r.html}
  by Vidar Bronken Gundersen and \url{https://cran.r-project.org/doc/contrib/R-and-octave.txt} by Robin Hankin. 
}
\keyword{ package }
\examples{
## The R implementation of these routines can be called "matlab-style",
bf <- butter(5, 0.2)
freqz(bf$b, bf$a)
## or "R-style" as:
freqz(bf)

## make a Chebyshev type II filter:
ch <- cheby2(5, 20, 0.2) 
freqz(ch, Fs = 100)  # frequency plot for a sample rate = 100 Hz

zplane(ch) # look at the poles and zeros

## apply the filter to a signal
t <- seq(0, 1, by = 0.01)                     # 1 second sample, Fs = 100 Hz
x <- sin(2*pi*t*2.3) + 0.25*rnorm(length(t))  # 2.3 Hz sinusoid+noise
z <- filter(ch, x)  # apply filter
plot(t, x, type = "l")
lines(t, z, col = "red")

# look at the group delay as a function of frequency
grpdelay(ch, Fs = 100)
}
