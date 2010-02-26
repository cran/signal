\name{impz}
\alias{impz}
\alias{impz.default}
\alias{impz.Arma}
\alias{impz.Ma}
\alias{print.impz}
\alias{plot.impz}
\title{ Impulse-response characteristics }
\description{
  Impulse-response characteristics of a discrete filter.
}
\usage{
\method{impz}{default}(filt, a = 1, n = NULL, Fs = 1, \ldots)

\method{impz}{Arma}(filt, \ldots)

\method{impz}{Ma}(filt, \ldots)

\method{plot}{impz}(x, \ldots)

\method{print}{impz}(x, \ldots)
}
\arguments{
  \item{filt}{ for the default case, the moving-average coefficients of
    an ARMA model or filter. Generically, \code{filt}
    specifies an arbitrary model or filter operation.}
  \item{a}{ the autoregressive (recursive) coefficients of an ARMA filter. }
  \item{n}{ number of points at which to evaluate the frequency response. }
  \item{Fs}{ sampling frequency in Hz. If not specified, the frequencies
    are in per unit. }
  \item{\ldots}{ for methods of \code{impz}, arguments are passed to
    the default method. For \code{plot.impz}, additional arguments are
    passed through to \code{plot}. }
  \item{x}{ object to be plotted. }
}
\details{
When results of \code{impz} are printed, the impulse response will be
plotted. As with
\code{lattice} plots, automatic printing does not work inside loops and
function calls, so explicit calls to \code{print} or \code{plot} are
needed there.
}
\value{
  For \code{impz}, a list of class \code{impz} with items:
  \item{x }{impulse response signal. }
  \item{t }{time.}
}
\references{ 
  \url{http://en.wikipedia.org/wiki/Impulse_response}
  
  Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Kurt Hornik and John W. Eaton.
 Conversion to R by Tom Short. }
\seealso{ \code{\link{filter}}, \code{\link{freqz}}, \code{\link{zplane}} }
\examples{
bt <- butter(5, 0.3)
impz(bt)
impz(ellip(5, 0.5, 30, 0.3))
}
\keyword{ math }

