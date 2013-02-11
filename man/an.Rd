\name{an}
\alias{an}
\title{ Complex unit phasor of the given angle in degrees.  }
\description{
  Complex unit phasor of the given angle in degrees.
}
\usage{
  an(degrees)
}
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
\examples{
  120*an(30) + 125*an(-160)
}
\keyword{ math }
