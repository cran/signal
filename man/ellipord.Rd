\name{ellipord}
\alias{ellipord}
\title{ Elliptic filter order and cutoff }
\description{
Compute discrete elliptic filter order and cutoff for the desired response
characteristics.}
\usage{
ellipord(Wp, Ws, Rp, Rs)
}
\arguments{
  \item{Wp, Ws}{ pass-band and stop-band edges. For a low-pass or
    high-pass filter, \code{Wp} and \code{Ws} are scalars. For a
    band-pass or band-rejection filter, both are vectors of length
    2. For a low-pass filter, \code{Wp < Ws}. For a
    high-pass filter, \code{Ws > Wp}. For a band-pass (\code{Ws[1] < Wp[1] < Wp[2] <
    Ws[2]}) or band-reject (\code{Wp[1] < Ws[1] < Ws[2] < Wp[2]})
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
  \item{type}{ filter type, one of \code{"low"}, \code{"high"}, \code{"stop"}, or \code{"pass"} }
  \item{Rp}{ dB of pass band ripple }
  \item{Rs}{ dB of stop band ripple }
  This object can be passed directly to \code{ellip} to compute discrete filter coefficients.
}
\references{
Lamar, Marcus Vinicius, Notas de aula da disciplina TE 456 - Circuitos Analogicos II, UFPR, 2001/2002.

Octave Forge \url{https://octave.sourceforge.io/}

}
\author{ Original Octave version by Paulo Neis
  \email{p_neis@yahoo.com.br}.
  Modified by Doug Stewart. Conversion to R by Tom Short. }
\seealso{ \code{\link{Arma}}, \code{\link{filter}}, \code{\link{butter}},
  \code{\link{cheby1}}, and \code{\link{ellipord}}}
\examples{
Fs <- 10000
elord <- ellipord(1000/(Fs/2), 1200/(Fs/2), 0.5, 29)
plot(c(0, 1000, 1000, 0, 0), c(0, 0, -0.5, -0.5, 0),
     type = "l", xlab = "Frequency (Hz)", ylab = "Attenuation (dB)")
el1 <- ellip(elord)
plot(c(0, 1000, 1000, 0, 0), c(0, 0, -0.5, -0.5, 0),
     type = "l", xlab = "Frequency (Hz)", ylab = "Attenuation (dB)",
     col = "red", ylim = c(-35,0), xlim = c(0,2000))
lines(c(5000, 1200, 1200, 5000, 5000), c(-1000, -1000, -29, -29, -1000),
      col = "red")
hf <- freqz(el1, Fs = Fs)
lines(hf$f, 20*log10(abs(hf$h)))
}
\keyword{ math }
