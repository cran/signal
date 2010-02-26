\name{grpdelay}
\alias{grpdelay}
\alias{grpdelay.default}
\alias{grpdelay.Arma}
\alias{grpdelay.Ma}
\alias{grpdelay.Zpg}
\alias{plot.grpdelay}
\alias{print.grpdelay}
\title{ Group delay of a filter or model }
\description{
  
  The group delay of a filter or model. The group delay is the time
  delay for a sinusoid at a given frequency.
  
}
\usage{
\method{grpdelay}{default}(filt, a = 1, n = 512, whole = FALSE, Fs = NULL, \ldots)

\method{grpdelay}{Arma}(filt, \ldots)

\method{grpdelay}{Ma}(filt, \ldots)

\method{grpdelay}{Zpg}(filt, \ldots)

\method{plot}{grpdelay}(x, \ldots)

\method{print}{grpdelay}(x, \ldots)
}
\arguments{
  \item{filt}{ for the default case, the moving-average coefficients of
    an ARMA model or filter. Generically, \code{filt}
    specifies an arbitrary model or filter operation.}
  \item{a}{ the autoregressive (recursive) coefficients of an ARMA filter. }
  \item{n}{ number of points at which to evaluate the frequency response. }
  \item{whole}{ \code{'half'} or \code{FALSE} (the default) to evaluate
    around the upper half of the
    unit circle or \code{'whole'} to evaluate around the entire unit circle. }
  \item{Fs}{ sampling frequency in Hz. If not specified, the frequencies
    are in radians. }
  \item{x}{ object to be plotted. }
  \item{\ldots}{ for methods of \code{grpdelay}, arguments are passed to
    the default method. For \code{plot.grpdelay}, additional arguments
    are passed through to \code{plot}. }
}
\details{
For fastest computation, \code{n} should factor into a small number of
small primes.

If the denominator of the computation becomes too small, the group delay
is set to zero.  (The group delay approaches infinity when
there are poles or zeros very close to the unit circle in the z plane.)

When results of \code{grpdelay} are printed, the group delay will be
plotted. As with \code{lattice} plots, automatic printing does not work
inside loops and function calls, so explicit calls to \code{print} or
\code{plot} are needed there.
}
\value{
  A list of class \code{grpdelay} with items:
  \item{gd }{the group delay, in units of samples.  It can be converted
    to seconds by multiplying by the sampling period (or dividing by
    the sampling rate \code{Fs}).}
  \item{w }{frequencies at which the group delay was calculated.}
  \item{ns }{number of points at which the group delay was calculated.}
  \item{HzFlag }{\code{TRUE} for frequencies in Hz, \code{FALSE} for frequencies in radians.}
}
\references{
  
  \url{http://ccrma.stanford.edu/~jos/filters/Numerical_Computation_Group_Delay.html}

  \url{http://en.wikipedia.org/wiki/Group_delay}

  Octave Forge \url{http://octave.sf.net}
}

\author{ Original Octave version by Julius O. Smith III and Paul Kienzle. Conversion to R by Tom Short. }
\seealso{ \code{\link{filter}}, \code{\link{Arma}}, \code{\link{freqz}}
}
\examples{
# Two Zeros and Two Poles
b <- poly(c(1/0.9*exp(1i*pi*0.2), 0.9*exp(1i*pi*0.6)))
a <- poly(c(0.9*exp(-1i*pi*0.6), 1/0.9*exp(-1i*pi*0.2)))
grpdelay(b, a, 512, 'whole', 1)
}
\keyword{ math }
