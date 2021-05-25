\name{unwrap}
\alias{unwrap}
\title{ Unwrap radian phases }
\description{
Unwrap radian phases by adding multiples of 2*pi as appropriate to
remove jumps.
}
\usage{
unwrap(a, tol = pi, dim = 1)
}
\arguments{
  \item{a}{ vector of phase angles in radians. }
  \item{tol}{ tolerance for removing phase jumps. }
  \item{dim}{ dimension with which to apply the phase unwrapping. }
}
\value{
  A vector with the unwrapped phase angles.
}
\references{ 
  Octave Forge \url{https://octave.sourceforge.io/}
}
\author{ Original Octave version by Bill Lash. Conversion to R by Tom Short. }

\examples{
phase <- c(seq(0, 2*pi, length=500), seq(0, 2*pi, length=500))
plot(phase, type = "l", ylim = c(0, 4*pi))
lines(unwrap(phase), col = "blue")
}
\keyword{ math }
