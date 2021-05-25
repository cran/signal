\name{chirp}
\alias{chirp}
\title{ A chirp signal }
\description{
Generate a chirp signal.  A chirp signal is a frequency swept cosine wave.
}
\usage{
chirp(t, f0 = 0, t1 = 1, f1 = 100, 
      form = c("linear", "quadratic", "logarithmic"), phase = 0)
}
\arguments{
  \item{t}{ array of times at which to evaluate the chirp signal. }
  \item{f0}{ frequency at time t=0. }
  \item{t1}{ time, s. }
  \item{f1}{ frequency at time t=t1. }
  \item{form}{ shape of frequency sweep, one of \code{"linear"}, \code{"quadratic"},
    or \code{"logarithmic"}. }
  \item{phase}{ phase shift at t=0. }
}
\details{

  \code{'linear'} is:
  
  \deqn{f(t) = (f1-f0)*(t/t1) + f0}
  
  \code{'quadratic'} is:

  \deqn{f(t) = (f1-f0)*(t/t1)^2 + f0}
  
  \code{'logarithmic'} is:

  \deqn{f(t) = (f1-f0)^{t/t1} + f0}
}
\value{
  Chirp signal, an array the same length as \code{t}.
}
\references{ 
Octave Forge \url{https://octave.sourceforge.io/}
}
\author{ Original Octave version by Paul Kienzle.
  Conversion to R by Tom Short. }
\seealso{ \code{\link{specgram}} }
\examples{
ch <- chirp(seq(0, 0.6, len=5000))
plot(ch, type = "l")

# Shows a quadratic chirp of 400 Hz at t=0 and 100 Hz at t=10
# Time goes from -2 to 15 seconds.
specgram(chirp(seq(-2, 15, by=0.001), 400, 10, 100, "quadratic"))

# Shows a logarithmic chirp of 200 Hz at t=0 and 500 Hz at t=2
# Time goes from 0 to 5 seconds at 8000 Hz.
specgram(chirp(seq(0, 5, by=1/8000), 200, 2, 500, "logarithmic"))
}
\keyword{ math }
