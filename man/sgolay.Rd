\name{sgolay}
\alias{sgolay}
\title{ Savitzky-Golay smoothing filters }
\description{
Computes the filter coefficients for all Savitzky-Golay smoothing
filters.
}
\usage{
sgolay(p, n, m = 0, ts = 1)
}
\arguments{
  \item{p}{ filter order. }
  \item{n}{ filter length (must be odd). }
  \item{m}{ return the m-th derivative of the filter coefficients.}
  \item{ts}{ time scaling factor. }
}
\details{
  The early rows of the result \code{F} smooth based on future values and later rows
smooth based on past values, with the middle row using half future
and half past.  In particular, you can use row \code{i} to estimate \code{x[k]}
based on the \code{i-1} preceding values and the \code{n-i} following values of x
values as \code{y[k] = F[i,] * x[(k-i+1):(k+n-i)]}.

Normally, you would apply the first \code{(n-1)/2} rows to the first \code{k}
points of the vector, the last \code{k} rows to the last \code{k} points of the
vector and middle row to the remainder, but for example if you were
running on a realtime system where you wanted to smooth based on the
all the data collected up to the current time, with a lag of five
samples, you could apply just the filter on row \code{n-5} to your window
of length \code{n} each time you added a new sample.
}
\value{
An square matrix with dimensions \code{length(n)} that is of
class \code{'sgolayFilter'} (so it can be used with \code{filter}).}
\references{
  William H. Press, Saul A. Teukolsky, William T. Vetterling, Brian
  P. Flannery, \emph{Numerical Recipes in C: The Art of Scientific Computing} ,
  2nd edition, Cambridge Univ. Press, N.Y., 1992.
  
  Octave Forge \url{https://octave.sourceforge.io/}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@users.sf.net}. Modified by Pascal Dupuis. Conversion to R by Tom Short. }

\seealso{ \code{\link{sgolayfilt}}, \code{\link{filter}}}
\keyword{ math }
