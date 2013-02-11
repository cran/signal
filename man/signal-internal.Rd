\name{signal-internal}
\alias{ellipke}
\alias{fractdiff}
\alias{logseq}
\alias{ncauer}
\alias{cheb}
\alias{postpad}
\alias{sinc}
\alias{mkpp}
\alias{ppval}
\title{Internal or uncommented functions}
\description{
  Internal or barely commented functions not exported from the Namespace.
}
\details{
  \preformatted{
# MOSTLY MATLAB/OCTAVE COMPATIBLE UTILITIES
  fractdiff(x, d) # Fractional differences
  postpad(x, n)   # pad \code{x} with zeros at the end for a total length \code{n}
                  # truncates if length(x) < n
  sinc(x)         # sin(pi * x) / (pi * x)

# MATLAB-INCOMPATIBLE UTILITIES
  logseq(from, to, n = 500) # like \code{linspace} but equally spaced logarithmically

# MAINLY INTERNAL, BUT MATLAB COMPATIBLE
  mkpp(x, P, d = round(NROW(P)/pp$n)) # used by \code{pchip}
  ## Construct a piece-wise polynomial structure from sample points x and
  ## coefficients P. 
  ppval(pp, xi) # used by \code{pchip}
  ## Evaluate piece-wise polynomial pp and points xi.
  ncauer(Rp, Rs, n) # used by \code{ellip}
  ellipke(m, Nmax)  # used by \code{ellip}
  cheb(n, x) # nth-order Chebyshev polynomial calculated at x
             # used by \code{chebwin}
}
}
\keyword{ math }
