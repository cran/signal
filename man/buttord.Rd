\name{buttord}
\alias{buttord}
\title{ Butterworth filter order and cutoff }
\description{
Compute butterworth filter order and cutoff for the desired response
characteristics.}
\usage{
buttord(Wp, Ws, Rp, Rs)
}
\arguments{
  \item{Wp, Ws}{ pass-band and stop-band edges. For a low-pass or
    high-pass filter, \code{Wp} and \code{Ws} are scalars. For a
    band-pass or band-rejection filter, both are vectors of length
    2. For a low-pass filter, Wp < Ws. For a
    high-pass filter, Ws > Wp. For a band-pass (\code{Ws[1] < Wp[1] < Wp[2] <
    Ws[2]}) or band-reject (\code{Wp[1] < Ws[1] < Ws[2] < Wp[2]})
    filter design, \code{Wp} gives the edges of the pass band, and \code{Ws} gives
    the edges of the stop band. Frequencies are normalized to [0,1],
    corresponding to the range [0, Fs/2]. }
  \item{Rp}{ allowable decibels of ripple in the pass band. }
  \item{Rs}{ minimum attenuation in the stop band in dB. }
}
\details{
  Deriving the order and cutoff is based on:

  \deqn{|H(W)|^2 = \frac{1}{1+(W/Wc)^{2n}} = 10^{-R/10}}{%
        |H(W)|^2 = 1 / [1+(W/Wc)^(2n)] = 10^(-R/10)}

  With some algebra, you can solve simultaneously for \code{Wc} and \code{n} given
\code{Ws}, \code{Rs} and \code{Wp}, \code{Rp}.  For high-pass filters, subtracting the band edges
from Fs/2, performing the test, and swapping the resulting \code{Wc} back
works beautifully.  For bandpass- and bandstop-filters, this process
significantly overdesigns.  Artificially dividing \code{n} by 2 in this case
helps a lot, but it still overdesigns.
}
\value{
  An object of class \code{FilterOfOrder} with the following list elements:
  \item{n}{ filter order }
  \item{Wc}{ cutoff frequency }
  \item{type}{ filter type, one of "low", "high", "stop", or "pass" }
  This object can be passed directly to \code{butter} to compute filter coefficients.
}
\references{ 
Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle,
  \email{pkienzle@user.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{butter}}, \code{\link{FilterOfOrder}}, \code{\link{cheb1ord}} }
\examples{
Fs = 10000
btord = buttord(1000/(Fs/2), 1200/(Fs/2), 0.5, 29)
plot(c(0, 1000, 1000, 0, 0), c(0, 0, -0.5, -0.5, 0),
     type = "l", xlab = "Frequency (Hz)", ylab = "Attenuation (dB)")
bt = butter(btord)
plot(c(0, 1000, 1000, 0, 0), c(0, 0, -0.5, -0.5, 0),
     type = "l", xlab = "Frequency (Hz)", ylab = "Attenuation (dB)",
     col = "red", ylim = c(-10,0), xlim = c(0,2000))
hf = freqz(bt, Fs = Fs)
lines(hf$f, 20*log10(abs(hf$h)))

}
\keyword{ math }
