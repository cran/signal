## Copyright (C) 2006 EPRI Solutions, Inc.
## by Tom Short, tshort@eprisolutions.com
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

m2R <- function(mfile, Rfile = gsub(".m$", ".R", mfile)) {
  s <- readLines(mfile)
 
  s <- gsub("^%", "#", s)
  s <- gsub("function(..*)=(..*)\\((..*)", "\\2 <- function( \\3  { # \\1", s)
  s <- gsub("end", "} #", s)
  s <- gsub("for(..*)=(..*):(..*)", "for (\\1 in \\2 : \\3) {", s)
#  s <- gsub("_/s//./g", s)
  s <- gsub("; *$", "", s)
  s <- gsub("==", "@@", s)
#  s <- gsub("=", "<-", s)
  s <- gsub("@@", "==", s)
  s <- gsub("zeros\\(", "matrix(0, ", s)
  s <- gsub("ones\\(", "matrix(1, ", s)
  s <- gsub("eye\\(", "diag(1, ", s)
#  s <- gsub("\/", "solve(,)", s)
#  s <- gsub("fsolve('\(..*\)'", "//ms(~\1 /g", s)
#  s <- gsub("param(\(..*\))/s//param[ \1 ] /g", s)
#  s <- gsub("var(\(..*\))/s//var[ \1 ] /g", s)
#  s <- gsub("mod1(\(..*\)/s//mod1[ \1 /g", s)
  writeLines(s, Rfile)
}
