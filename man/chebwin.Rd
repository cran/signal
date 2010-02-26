\name{chebwin}
\alias{chebwin}
\encoding{latin1}
\title{ Dolph-Chebyshev window coefficients }
\description{
 Returns the filter coefficients of the n-point Dolph-Chebyshev window
 with a given attenuation.
}
\usage{
chebwin(n, at)
}
\arguments{
  \item{n}{ length of the filter; number of coefficients to generate. }
  \item{at}{ dB of attenuation in the stop-band of the corresponding
 Fourier transform. }
}
\details{
The window is described in frequency domain by the expression:

\deqn{ W(k) = \frac{Cheb(n-1, \beta * cos(pi * k/n))}{Cheb(n-1, \beta)}}{
       W(k) = [Cheb(n-1, \beta * cos(pi * k/n))] / Cheb(n-1, \beta)}
with

  \deqn{\beta = cosh(1/(n-1) * acosh(10^{at/20}))}{\beta = cosh(1/(n-1) * acosh(10^(at/20)))}

and \eqn{Cheb(m,x)} denoting the \eqn{m}-th order Chebyshev polynomial calculated
at the point \eqn{x}.

Note that the denominator in \eqn{W(k)} above is not computed, and after
the inverse Fourier transform the window is scaled by making its
maximum value unitary.
}
\value{
  An array of length \code{n} with the filter coefficients. 
}
\references{
Peter Lynch, \dQuote{The Dolph-Chebyshev Window: A Simple Optimal Filter},
Monthly Weather Review, Vol. 125, pp. 655-660, April 1997.
\url{http://www.maths.tcd.ie/~plynch/Publications/Dolph.pdf}

C. Dolph, \dQuote{A current distribution for broadside arrays which
optimizes the relationship between beam width and side-lobe level},
Proc. IEEE, 34, pp. 335-348.

Octave Forge \url{http://octave.sf.net}
}
\author{Original Octave version by André Carezia, \email{acarezia@uol.com.br}. Conversion to R by Tom Short.}
\seealso{ \code{\link{kaiser}} }
\examples{
  plot(chebwin(50, 100))
}
\keyword{ math }
