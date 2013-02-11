\name{freqs}
\alias{freqs}
\alias{freqs.default}
\alias{freqs.Arma}
\alias{freqs.Ma}
\alias{plot.freqs}
\alias{print.freqs}
\alias{freqs_plot}
\alias{freqs_plot.default}
\alias{freqs_plot.freqs}
\title{ s-plane frequency response }
\description{
Compute the s-plane frequency response of an ARMA model (IIR filter).

}
\usage{
\method{freqs}{default}(filt = 1, a = 1, W, \ldots)

\method{freqs}{Arma}(filt, \ldots)

\method{freqs}{Ma}(filt, \ldots)

\method{print}{freqs}(x, \ldots)

\method{plot}{freqs}(x, \ldots)

\method{freqs_plot}{default}(w, h, \ldots) 

\method{freqs_plot}{freqs}(w, \ldots) 

}
\arguments{
  \item{filt}{ for the default case, the moving-average coefficients of
    an ARMA model or filter. Generically, \code{filt}
    specifies an arbitrary model or filter operation.}
  \item{a}{ the autoregressive (recursive) coefficients of an ARMA filter. }
  \item{W}{ the frequencies at which to evaluate the model. }
  \item{w}{ for the default case, the array of frequencies. Generically, \code{w}
    specifies an object from which to plot a frequency response. }
  \item{h}{ a complex array of frequency responses at the given frequencies. }
  \item{x}{ object to be plotted. }
  \item{\ldots}{ additional arguments passed through to \code{plot}. }
}
\details{

When results of \code{freqs} are printed, \code{freqs_plot} will be
called to display frequency plots of magnitude and phase. As with
\code{lattice} plots, automatic printing does not work inside loops and
function calls, so explicit calls to \code{print} are
needed there.

}
\value{
  For \code{freqs} list of class \code{freqs} with items:
  \item{H}{ array of frequencies. }
  \item{W}{ complex array of frequency responses at those frequencies.}

}
\author{ Original Octave version by Julius O. Smith III. Conversion to R by Tom Short. }
\seealso{ \code{\link{filter}}, \code{\link{Arma}}, \code{\link{freqz}}
}
\examples{
b <- c(1, 2)
a <- c(1, 1)
w <- seq(0, 4, length=128)
freqs(b, a, w)
}
\keyword{ math }
