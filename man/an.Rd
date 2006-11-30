\name{an}
\alias{an}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Complex unit phasor of the given angle in degrees.  }
\description{
  Complex unit phasor of the given angle in degrees.
}
\usage{
  an(degrees)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{degrees}{ Angle in degrees. }
}
\details{
  This is a utility function to make it easier to specify phasor values
  as a magnitude times an angle in degrees. 
}
\value{
  A complex value or array of \code{exp(1i*degrees*pi/180)}.
}
\references{ ~put references to the literature/web site here ~ }
\examples{
  120*an(30) + 125*an(-160)
}
\keyword{ math }
