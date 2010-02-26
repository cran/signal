\name{cheb1ord}
\alias{cheb1ord}
\title{ Chebyshev type-I filter order and cutoff }
\description{
Compute discrete Chebyshev type-I filter order and cutoff for the desired response
characteristics.}
\usage{
cheb1ord(Wp, Ws, Rp, Rs)
}
\arguments{
  \item{Wp, Ws}{ pass-band and stop-band edges. For a low-pass or
    high-pass filter, \code{Wp} and \code{Ws} are scalars. For a
    band-pass or band-rejection filter, both are vectors of length
    2. For a low-pass filter, Wp < Ws. For a
    high-pass filter, Ws > Wp. For a band-pass (Ws[1] < Wp[1] < Wp[2] <
    Ws[2]) or band-reject (Wp[1] < Ws[1] < Ws[2] < Wp[2])
    filter design, \code{Wp} gives the edges of the pass band, and \code{Ws} gives
    the edges of the stop band. Frequencies are normalized to [0,1],
    corresponding to the range [0, Fs/2]. }
  \item{Rp}{ allowable decibels of ripple in the pass band. }
  \item{Rs}{ minimum attenuation in the stop band in dB. }
}
\value{
  An object of class \code{FilterOfOrder} with the following list elements:
  \item{n}{ filter order }
  \item{Wc}{ cutoff frequency }
  \item{Rp}{ allowable decibels of ripple in the pass band }
  \item{type}{ filter type, one of "low", "high", "stop", or "pass" }
  This object can be passed directly to \code{cheby1} to compute filter coefficients.
}
\references{ 
Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle,
  \email{pkienzle@user.sf.net} and by Laurent S. Mazet. Conversion to R by Tom Short. }
\seealso{ \code{\link{cheby1}}, \code{\link{FilterOfOrder}}, \code{\link{buttord}} }
\examples{
Fs <- 10000
chord <- cheb1ord(1000/(Fs/2), 1200/(Fs/2), 0.5, 29)
plot(c(0, 1000, 1000, 0, 0), c(0, 0, -0.5, -0.5, 0),
     type = "l", xlab = "Frequency (Hz)", ylab = "Attenuation (dB)")
ch1 <- cheby1(chord)
plot(c(0, 1000, 1000, 0, 0), c(0, 0, -0.5, -0.5, 0),
     type = "l", xlab = "Frequency (Hz)", ylab = "Attenuation (dB)",
     col = "red", ylim = c(-10,0), xlim = c(0,2000))
hf <- freqz(ch1, Fs = Fs)
lines(hf$f, 20*log10(abs(hf$h)))
}
\keyword{ math }
