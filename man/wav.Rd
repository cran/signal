\name{wav}
\alias{wav}
\docType{data}
\title{Example wav file}
\description{Example wav file audio waveshape from Octave.}
\usage{data(wav)}
\format{
  The format is:
List of 3
 $ sound: num [1, 1:17380] -0.000275 -0.00061 -0.000397 -0.000793 -0.000305 ...
 $ rate : int 22050
 $ bits : int 16
 - attr(*, "class")= chr "Sample"
}
\details{
Sound samples are in Element \dQuote{sound} while \dQuote{rate} is the sampling rate (in Hz)
and \dQuote{bits} the resolution of the underlying Wave file.}
\source{Octave}
\examples{
data(wav)
str(wav)
}
\keyword{datasets}
