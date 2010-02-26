\name{specgram}
\alias{specgram}
\alias{plot.specgram}
\alias{print.specgram}
\title{ Spectogram plot }
\description{
Generate a spectrogram for the signal. This chops the signal into
overlapping slices, windows each slice and applies a Fourier
transform to determine the frequency components at that slice.
}
\usage{
specgram(x, n = min(256, length(x)), Fs = 2, window = hanning(n), overlap = length(window)/2)

\method{plot}{specgram}(x, ...)

\method{print}{specgram}(x, ...)
}
\arguments{
  \item{x}{ the vector of samples. }
  \item{n}{ the size of the Fourier transform window. }
  \item{Fs}{ the sample rate, Hz. }
  \item{window}{ shape of the fourier transform window, defaults to
    \code{hanning(n)}. The window length for a hanning window can be
    specified instead. }
  \item{overlap}{ overlap with previous window, defaults to half the
    window length. }
  \item{\ldots}{ additional arguments (ignored). }
}
\details{

When results of \code{specgram} are printed, a spectogram will be plotted.
As with
\code{lattice} plots, automatic printing does not work inside loops and
function calls, so explicit calls to \code{print} or \code{plot} are
needed there.

The choice of window defines the time-frequency resolution.  In
speech for example, a wide window shows more harmonic detail while a
narrow window averages over the harmonic detail and shows more
formant structure. The shape of the window is not so critical so long
as it goes gradually to zero on the ends.

Step size (which is window length minus overlap) controls the
horizontal scale of the spectrogram. Decrease it to stretch, or
increase it to compress. Increasing step size will reduce time
resolution, but decreasing it will not improve it much beyond the
limits imposed by the window size (you do gain a little bit,
depending on the shape of your window, as the peak of the window
slides over peaks in the signal energy).  The range 1-5 msec is good
for speech.

FFT length controls the vertical scale.  Selecting an FFT length
greater than the window length does not add any information to the
spectrum, but it is a good way to interpolate between frequency
points which can make for prettier spectrograms.

After you have generated the spectral slices, there are a number of
decisions for displaying them.  First the phase information is
discarded and the energy normalized:

    \code{S = abs(S); S = S/max(S)}

Then the dynamic range of the signal is chosen.  Since information in
speech is well above the noise floor, it makes sense to eliminate any
dynamic range at the bottom end.  This is done by taking the max of
the magnitude and some minimum energy such as minE=-40dB. Similarly,
there is not much information in the very top of the range, so
clipping to a maximum energy such as maxE=-3dB makes sense:

   \code{S = max(S, 10^(minE/10)); S = min(S, 10^(maxE/10))}

The frequency range of the FFT is from 0 to the Nyquist frequency of
one half the sampling rate.  If the signal of interest is band
limited, you do not need to display the entire frequency range. In
speech for example, most of the signal is below 4 kHz, so there is no
reason to display up to the Nyquist frequency of 10 kHz for a 20 kHz
sampling rate.  In this case you will want to keep only the first 40\%
of the rows of the returned \code{S} and \code{f}.  More generally, to display the
frequency range \code{[minF, maxF]}, you could use the following row index:

    \code{idx = (f >= minF & f <= maxF)}

Then there is the choice of colormap.  A brightness varying colormap
such as copper or bone gives good shape to the ridges and valleys. A
hue varying colormap such as jet or hsv gives an indication of the
steepness of the slopes.  The final spectrogram is displayed in log
energy scale and by convention has low frequencies on the bottom of
the image.

}
\value{
  For \code{specgram} list of class \code{specgram} with items:
  \item{S }{complex output of the FFT, one row per slice. }
  \item{f }{the frequency indices corresponding to the rows of S.}
  \item{t }{the time indices corresponding to the columns of S..}
}
\references{
  Octave Forge \url{http://octave.sf.net}
}
\author{ Original Octave version by Paul Kienzle
  \email{pkienzle@users.sf.net}. Conversion to R by Tom Short. }
\seealso{ \code{\link{fft}}, \code{\link{image}}}
\examples{
specgram(chirp(seq(-2, 15, by = 0.001), 400, 10, 100, 'quadratic'))
specgram(chirp(seq(0, 5, by = 1/8000), 200, 2, 500, "logarithmic"), Fs = 8000)

data(wav)  # contains wav$rate, wav$sound
Fs <- wav$rate
step <- trunc(5*Fs/1000)     # one spectral slice every 5 ms
window <- trunc(40*Fs/1000)  # 40 ms data window
fftn <- 2^nextpow2(window)   # next highest power of 2
spg <- specgram(wav$sound, fftn, Fs, window, window-step)
S <- abs(spg$S[2:(fftn*4000/Fs),]) # magnitude in range 0<f<=4000 Hz.
S <- S/max(S)         # normalize magnitude so that max is 0 dB.
S[S < 10^(-40/10)] <- 10^(-40/10)   # clip below -40 dB.
S[S > 10^(-3/10)] <- 10^(-3/10)    # clip above -3 dB.
image(t(20*log10(S)), axes = FALSE) #, col = gray(0:255 / 255))
}
\keyword{ math }
