\name{freqz}
\alias{freqz}
\alias{freqz.default}
\alias{freqz.Arma}
\alias{freqz.Ma}
\alias{freqz_plot}
\alias{freqz_plot.default}
\alias{freqz_plot.freqz}
\alias{plot.freqz}
\alias{print.freqz}
\title{ z-plane frequency response }
\description{
Compute the z-plane frequency response of an ARMA model or IIR filter.

}
\usage{
\method{freqz}{default}(filt = 1, a = 1, n = 512, region = NULL, Fs = 2 * pi, \ldots)

\method{freqz}{Arma}(filt, \ldots)

\method{freqz}{Ma}(filt, \ldots)

\method{print}{freqz}(x, \ldots)

\method{plot}{freqz}(x, \ldots)

\method{freqz_plot}{default}(w, h, \ldots) 

\method{freqz_plot}{freqz}(w, \ldots) 

}
\arguments{
  \item{filt}{ for the default case, the moving-average coefficients of
    an ARMA model or filter. Generically, \code{filt}
    specifies an arbitrary model or filter operation.}
  \item{a}{ the autoregressive (recursive) coefficients of an ARMA filter. }
  \item{n}{ number of points at which to evaluate the frequency response. }
  \item{region}{ \code{'half'} (the default) to evaluate around the upper half of the
    unit circle or \code{'whole'} to evaluate around the entire unit circle. }
  \item{Fs}{ sampling frequency in Hz. If not specified, the frequencies
    are in radians. }
  \item{w}{ for the default case, the array of frequencies. Generically,
    \code{w} specifies an object from which to plot a frequency response. }
  \item{h}{ a complex array of frequency responses at the given
    frequencies. }
  \item{x}{ object to be plotted. }
  \item{\ldots}{ for methods of \code{freqz}, arguments are passed to
    the default method. For \code{freqz_plot}, additional arguments are
    passed through to \code{plot}. }
}
\details{

For fastest computation, \code{n} should factor into a small number of
small primes.

When results of \code{freqz} are printed, \code{freqz_plot} will be
called to display frequency plots of magnitude and phase. As with
\code{lattice} plots, automatic printing does not work inside loops and
function calls, so explicit calls to \code{print} or \code{plot} are
needed there.

}
\value{
  For \code{freqz} list of class \code{freqz} with items:
  \item{h}{ complex array of frequency responses at those frequencies.}
  \item{f}{ array of frequencies. }

}
\references{ 
  Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by John W. Eaton. Conversion to R by Tom Short. }
\seealso{ \code{\link{filter}}, \code{\link{Arma}}, \code{\link{freqs}}
}
\examples{
b <- c(1, 0, -1)
a <- c(1, 0, 0, 0, 0.25)
freqz(b, a)
}
\keyword{ math }
