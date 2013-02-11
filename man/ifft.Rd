\name{ifft}
\alias{ifft}
\title{ Inverse FFT }
\description{
  Matlab/Octave-compatible inverse FFT.
}
\usage{
ifft(x)
}
\arguments{
  \item{x}{ the input array. }
}
\details{
  It uses \code{fft} from the stats package as follows:

  \code{fft(x, inverse = TRUE)/length(x)}

  Note that it does not attempt to make the results real.
}
\value{
  The inverse FFT of the input, the same length as \code{x}.
}
\author{ Tom Short }
\seealso{ \code{\link{fft}}}
\examples{
ifft(fft(1:4))
}
\keyword{ math }

