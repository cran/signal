\name{sftrans}
\alias{sftrans}
\alias{sftrans.default}
\alias{sftrans.Arma}
\alias{sftrans.Ma}
\alias{sftrans.Zpg}
\title{ Transform filter band edges }
\description{
Transform band edges of a generic lowpass filter to a filter with
different band edges and to other filter types (high pass, band pass, or
band stop).
}
\usage{
\method{sftrans}{default}(Sz, Sp, Sg, W, stop = FALSE, \ldots)

\method{sftrans}{Arma}(Sz, W, stop = FALSE, \ldots)

\method{sftrans}{Zpg}(Sz, W, stop = FALSE, \ldots)
}
\arguments{
  \item{Sz}{ In the generic case, a model to be transformed. In the
    default case, a vector containing the zeros in a pole-zero-gain model. }
  \item{Sp}{ a vector containing the poles in a pole-zero-gain model. }
  \item{Sg}{ a vector containing the gain in a pole-zero-gain model. }
  \item{W}{ critical frequencies of the target filter specified in
    radians. \code{W} must be a
    scalar for low-pass and high-pass filters, and \code{W} must be a
    two-element vector \code{c(low, high)} specifying the lower and
    upper bands. }
  \item{stop}{ \code{FALSE} for a low-pass or band-pass filter,
    \code{TRUE} for a high-pass or band-stop filter. }
  \item{\ldots}{ additional arguments (ignored). }
}
\details{

Given a low pass filter represented by poles and zeros in the
splane, you can convert it to a low pass, high pass, band pass or 
band stop by transforming each of the poles and zeros individually.
The following summarizes the transformations:

Low-Pass Transform         
\deqn{S -> C S/Fc}

\tabular{ll}{
Zero at x           \tab Pole at x         \cr
zero: \eqn{F_c x/C}  \tab \eqn{F_c x/C}\cr 
gain: \eqn{C/F_c}    \tab \eqn{F_c/C}  \cr 
}

High-Pass Transform         
\deqn{S -> C F_c/S}

\tabular{ll}{
Zero at x           \tab Pole at x   \cr
zero: \eqn{F_c C/x}  \tab \eqn{F_c C/x}\cr
pole: \eqn{0}       \tab \eqn{0}     \cr 
gain: \eqn{-x}      \tab \eqn{-1/x}  \cr 
}

Band-Pass Transform         
\deqn{S -> C \frac{S^2+F_hF_l}{S(F_h-F_l)}}{S -> C(S^2+F_h F_l)/[S(F_h-F_l)]}

\tabular{ll}{
Zero at x                         \tab Pole at x                 \cr
zero: \eqn{b \pm \sqrt(b^2-F_hF_l)}{b+/-\sqrt(b^2-F_h F_l)}\tab \eqn{b \pm \sqrt(b^2-F_hF_l)}{b+/-\sqrt(b^2-F_h F_l)}\cr
pole: \eqn{0}                     \tab \eqn{0}                   \cr 
gain: \eqn{C/(F_h-F_l)}           \tab \eqn{(F_h-F_l)/C}         \cr
\eqn{b = x/C (F_h-F_l)/2}         \tab \eqn{b=x/C (F_h-F_l)/2}   \cr
}

Band-Stop Transform         
\deqn{S -> C \frac{S(F_h-F_l)}{S^2+F_hF_l}}{S -> C[S(F_h-F_l)]/(S^2+F_h F_l)}
\tabular{ll}{
Zero at x                         \tab Pole at x                 \cr
zero: \eqn{b \pm \sqrt(b^2-F_hF_l)}{b+/-\sqrt(b^2-F_h F_l)}\tab \eqn{b \pm \sqrt(b^2-F_hF_l)}{b+/-\sqrt(b^2-F_h F_l)}\cr
pole: \eqn{\pm \sqrt(-F_hF_l)}{+/-\sqrt(-F_h F_l)}     \tab \eqn{\pm \sqrt(-F_hF_l)}{+/-\sqrt(-F_h F_l)}      \cr 
gain: \eqn{-x}                    \tab \eqn{-1/x}                \cr
\eqn{b = C/x (F_h-F_l)/2}         \tab \eqn{b=C/x (F_h-F_l)/2}   \cr
}

Bilinear Transform         
\deqn{S -> \frac{2}{T} \frac{z-1}{z+1}}{S -> (2/T)[(z-1)/(z+1)]}
\tabular{ll}{
Zero at x                       \tab Pole at x               \cr
zero: \eqn{(2+xT)/(2-xT)}       \tab \eqn{(2+xT)/(2-xT)}     \cr
pole: \eqn{-1}                  \tab \eqn{-1}                \cr 
gain: \eqn{(2-xT)/T}            \tab \eqn{(2-xT)/T}          \cr
}

where \eqn{C} is the cutoff frequency of the initial lowpass filter, \eqn{F_c} is
the edge of the target low/high pass filter and \eqn{[F_l,F_h]} are the edges
of the target band pass/stop filter.  With abundant tedious algebra,
you can derive the above formulae yourself by substituting the
transform for \eqn{S} into \eqn{H(S)=S-x} for a zero at \eqn{x} or \eqn{H(S)=1/(S-x)} for a
pole at \eqn{x}, and converting the result into the form:

   \deqn{H(S) = g \mbox{prod}(S-Xi) / \mbox{prod}(S-Xj)}{g prod(S-Xi) / prod(S-Xj)}

Please note that a pole and a zero at the same place exactly cancel.
This is significant for High Pass, Band Pass and Band Stop filters
which create numerous extra poles and zeros, most of which cancel.
Those which do not cancel have a \sQuote{fill-in} effect, extending the 
shorter of the sets to have the same number of as the longer of the
sets of poles and zeros (or at least split the difference in the case
of the band pass filter).  There may be other opportunistic
cancellations, but it does not check for them.

Also note that any pole on the unit circle or beyond will result in
an unstable filter.  Because of cancellation, this will only happen
if the number of poles is smaller than the number of zeros and the
filter is high pass or band pass.  The analytic design methods all
yield more poles than zeros, so this will not be a problem.

}
\value{
  For the default case or for \code{sftrans.Zpg}, an object of class
  \dQuote{Zpg}, containing the list elements:
  \item{zero}{ complex vector of the zeros of the transformed model}
  \item{pole}{ complex vector of the poles of the transformed model}
  \item{gain}{ gain of the transformed model}
  For \code{sftrans.Arma}, an object of class
  \dQuote{Arma}, containing the list elements:
  \item{b}{ moving average (MA) polynomial coefficients }
  \item{a}{ autoregressive (AR) polynomial coefficients }
}
\references{ Proakis & Manolakis (1992). \emph{Digital Signal Processing}. New York:
  Macmillan Publishing Company.

  Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@users.sf.net}. Conversion to R by Tom Short. }

\seealso{ \code{\link{Zpg}}, \code{\link{bilinear}},
  \code{\link{Arma}}}
\keyword{ math }
