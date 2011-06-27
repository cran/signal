\name{filter}
\alias{filter}
\alias{filter.default}
\alias{filter.Arma}
\alias{filter.Ma}
\alias{filter.Zpg}
\title{ Filter a signal. }
\description{
  Generic filtering function. The default is to filter with an ARMA
  filter of given coefficients. The default filtering operation follows
  Matlab/Octave conventions.
}
\usage{
\method{filter}{default}(filt, a, x, \dots)

\method{filter}{Arma}(filt, x, \dots)

\method{filter}{Ma}(filt, x, \dots)

\method{filter}{Zpg}(filt, x, \dots)
}
\arguments{
  \item{filt}{ For the default case, the moving-average coefficients of
    an ARMA filter (normally called \sQuote{b}). Generically, \code{filt}
    specifies an arbitrary filter operation.}
  \item{a}{ the autoregressive (recursive) coefficients of an ARMA filter. }
  \item{x}{ the input signal to be filtered. }
  \item{\ldots}{ additional arguments (ignored). }
}
\details{

The default filter is an ARMA filter defined as:

\deqn{a_1y_n + a_2y_{n-1} + \dots + a_ny_1 = b_1x_n +
  b_2x_{m-1} + \dots + b_mx_1}{
  a[1]*y[n] + a[2]*y[n-1] + \dots + a[n]*y[1] = b[1]*x[n] + b[2]*x[m-1] + \dots + b[m]*x[1]}

The default filter calls \code{stats:::filter}, so it returns a
time-series object. 

Since \code{filter} is generic, it can be extended to call other filter types.

}
\value{
  The filtered signal, normally of the same length of the input signal \code{x}.
}
\references{ 
\url{http://en.wikipedia.org/wiki/Digital_filter}

  Octave Forge \url{http://octave.sf.net}
}
\author{ Tom Short, EPRI Solutions, Inc., (\email{tshort@eprisolutions.com}) }
\seealso{ \code{\link[stats]{filter}} in the \pkg{stats} package, \code{\link{Arma}},
\code{\link{fftfilt}}, \code{\link{filtfilt}}, and \code{\link{runmed}}.}

\examples{
bf <- butter(3, 0.1)                          # 10 Hz low-pass filter
t <- seq(0, 1, len = 100)                     # 1 second sample
x <- sin(2*pi*t*2.3) + 0.25*rnorm(length(t))  # 2.3 Hz sinusoid+noise
z <- filter(bf, x) # apply filter
plot(t, x, type = "l")
lines(t, z, col = "red")

}
\keyword{ math }
