\name{signal-internal}
\alias{ellipke}
\alias{eps}
\alias{fractdiff}
\alias{linspace}
\alias{logseq}
\alias{m2R}
\alias{ncauer}
\alias{cheb}
\alias{nextpow2}
\alias{postpad}
\alias{sinc}
\alias{wav}
\alias{mkpp}
\alias{ppval}
\title{ Internal or uncommented functions  }
\description{
  Internal or barely commented functions.
}
\details{
  \preformatted{
# MOSTLY MATLAB/OCTAVE COMPATIBLE UTILITIES
  fractdiff(x, d) # Fractional differences
  linspace(from, to, n = 500) # seq(from, to, length = 500)
  nextpow2(x) # next power of 2
  postpad(x, n) # pad \code{x} with zeros at the end for a total length \code{n}
                # truncates if length(x) < n
  sinc(x) # sin(pi * x) / (pi * x)

# MATLAB-INCOMPATIBLE UTILITIES
  logseq(from, to, n = 500) # like \code{linspace} but equally spaced logarithmically

# DATA
  eps # .Machine$double.eps

# DATA SET
  wav # example wav file audio waveshape from Octave

# MAINLY INTERNAL, BUT MATLAB COMPATIBLE
  mkpp(x, P, d = round(NROW(P)/pp$n)) # used by \code{pchip}
  ## Construct a piece-wise polynomial structure from sample points x and
  ## coefficients P. 
  ppval(pp, xi) # used by \code{pchip}
  ## Evaluate piece-wise polynomial pp and points xi.
  ncauer(Rp, Rs, n) # used by \code{ellip}
  ellipke(m) # used by \code{ellip}
  cheb(n, x) # nth-order Chebyshev polynomial calculated at x
             # used by \code{chebwin}
  
# UTILITIES
  m2R(mfile, Rfile = gsub(".m$", ".R", mfile)) # crude matlab to R converter
}
}
\keyword{ math }
