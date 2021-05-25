\name{conv}
\alias{conv}
\title{ Convolution }
\description{
  
A Matlab/Octave compatible convolution function that uses the Fast Fourier
Transform.

}
\usage{
conv(x, y)
}
\arguments{
  \item{x,y}{ numeric sequences to be convolved. }
}
\details{
  The inputs \code{x} and \code{y} are post padded with zeros as follows:

  \code{ifft(fft(postpad(x, n) * fft(postpad(y, n))))}

  where \code{n = length(x) + length(y) - 1}
}
\value{
  An array of length equal to \code{length(x) + length(y) - 1}.
  If \code{x} and \code{y} are polynomial coefficient vectors,
     \code{conv} returns the coefficients of the product polynomial.
}
\references{ 
Octave Forge \url{https://octave.sourceforge.io/}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{convolve}}, \code{\link{fft}},
  \code{\link{ifft}}, \code{\link{fftfilt}}, \code{\link{poly}} }
\examples{
conv(c(1,2,3), c(1,2))
conv(c(1,2), c(1,2,3))
conv(c(1,-2), c(1,2))
}
\keyword{ math }

