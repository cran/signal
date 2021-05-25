\name{bilinear}
\alias{bilinear}
\alias{bilinear.default}
\alias{bilinear.Zpg}
\alias{bilinear.Arma}

\title{ Bilinear transformation }
\description{
  Transform a s-plane filter specification into a z-plane
specification.
}
\usage{
\method{bilinear}{default}(Sz, Sp, Sg, T, \dots)

\method{bilinear}{Zpg}(Sz, T, \dots)

\method{bilinear}{Arma}(Sz, T, \dots)
}
\arguments{
  \item{Sz}{ In the generic case, a model to be transformed. In the
    default case, a vector containing the zeros in a pole-zero-gain model. }
  \item{Sp}{ a vector containing the poles in a pole-zero-gain model. }
  \item{Sg}{ a vector containing the gain in a pole-zero-gain model. }
  \item{T}{ the sampling frequency represented in the z plane. }
  \item{\dots}{ Arguments passed to the generic function. }
}
\details{
Given a piecewise flat filter design, you can transform it
from the s-plane to the z-plane while maintaining the band edges by
means of the bilinear transform.  This maps the left hand side of the
s-plane into the interior of the unit circle.  The mapping is highly
non-linear, so you must design your filter with band edges in the
s-plane positioned at \eqn{2/T tan(w*T/2)} so that they will be positioned
at w after the bilinear transform is complete.

The bilinear transform is:

\deqn{z = \frac{1 + sT/2}{1 - sT/2}}{z = (1 + sT/2) / (1 - sT/2)}

\deqn{s = \frac{T}{2}\frac{z - 1}{z + 1}}{s = (T/2) * (z - 1) / (z + 1)}

Please note that a pole and a zero at the same place exactly cancel.
This is significant since the bilinear transform creates numerous
extra poles and zeros, most of which cancel. Those which do not
cancel have a \dQuote{fill-in} effect, extending the shorter of the sets to
have the same number of as the longer of the sets of poles and zeros
(or at least split the difference in the case of the band pass
filter). There may be other opportunistic cancellations, but it will
not check for them.

Also note that any pole on the unit circle or beyond will result in
an unstable filter. Because of cancellation, this will only happen
if the number of poles is smaller than the number of zeros. The
analytic design methods all yield more poles than zeros, so this will
not be a problem.

}
\value{
  For the default case or for \code{bilinear.Zpg}, an object of class
  \dQuote{Zpg}, containing the list elements:
  \item{zero}{ complex vector of the zeros of the transformed model }
  \item{pole}{ complex vector of the poles of the transformed model }
  \item{gain}{ gain of the transformed model }
  For \code{bilinear.Arma}, an object of class
  \dQuote{Arma}, containing the list elements:
  \item{b}{ moving average (MA) polynomial coefficients }
  \item{a}{ autoregressive (AR) polynomial coefficients }
}
\references{ Proakis & Manolakis (1992). \emph{Digital Signal Processing}. New York:
  Macmillan Publishing Company.

  \url{https://en.wikipedia.org/wiki/Bilinear_transform}

  Octave Forge \url{https://octave.sourceforge.io/}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }

\seealso{ \code{\link{Zpg}}, \code{\link{sftrans}},
  \code{\link{Arma}}}
\keyword{ math }
