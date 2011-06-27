\name{Arma}
\alias{Arma}
\alias{as.Arma}
\alias{as.Arma.Arma}
\alias{as.Arma.Zpg}
\alias{as.Arma.Ma}
\title{ Create an autoregressive moving average (ARMA) model. }
\description{
  Returns an ARMA model. The model could represent a filter or system model.
}
\usage{
Arma(b, a)

\method{as.Arma}{Zpg}(x, \dots)

\method{as.Arma}{Arma}(x, \dots)

\method{as.Arma}{Ma}(x, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{b}{ moving average (MA) polynomial coefficients. }
  \item{a}{ autoregressive (AR) polynomial coefficients. }
  \item{x}{ model or filter to be converted to an ARMA representation. }
  \item{\dots}{ additional arguments (ignored). }
}
\details{
The ARMA model is defined by:

      \deqn{a(L)y(t) =  b(L)x(t)}

The ARMA model can define an analog or digital model. The AR and MA
polynomial coefficients follow the Matlab/Octave convention where the
coefficients are in decreasing order of the polynomial (the opposite of
the definitions for filter from the stats package and polyroot from the
base package). For an analog model,

\deqn{H(s) = \frac{b_1s^{m-1} + b_2s^{m-2} + \dots + b_m}{a_1s^{n-1} +
    a_2s^{n-2} + \dots + a_n}}{
  H(s) = (b[1]*s^(m-1) + b[2]*s^(m-2) + \dots + b[m]) / (a[1]*s^(n-1) + a[2]*s^(n-2) + \dots + a[n])}
              
For a z-plane digital model,

\deqn{H(z) = \frac{b_1 + b_2z^{-1} + \dots + b_mz^{-m+1}}{a_1 + a_2z^{-1} + \dots + a_nz^{-n+1}}}{ 
      H(z) = (b[1] + b[2]*z^(-1) + \dots + b[m]*z^(-m+1)) / (a[1] + a[2]*z^(-1) + \dots + a[n]*z^(-n+1))}

\code{as.Arma} converts from other forms, including \code{Zpg} and \code{Ma}. 
          
}
\value{
  A list of class \code{Arma} with the following list elements:
  \item{b}{ moving average (MA) polynomial coefficients }
  \item{a}{ autoregressive (AR) polynomial coefficients }
}
\author{ Tom Short, EPRI Solutions, Inc., (\email{tshort@eprisolutions.com}) }
\seealso{ See also \code{\link{as.Zpg}}, \code{\link{Ma}}, \code{\link{filter}}, and various
  filter-generation functions like \code{\link{butter}} and
  \code{\link{cheby1}} that return Arma models.}

\examples{
filt <- Arma(b = c(1, 2, 1)/3, a = c(1, 1))
zplane(filt)
}
\keyword{ math }
