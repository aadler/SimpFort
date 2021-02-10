LLC_f <- function(x, l, a) {
  if (length(l) > 1 | length(a) > 1) {
    stop("This toy example is restricted to singular values of the limit and attachment.")}
  .Call(c_llc_f, as.double(x), as.double(l), as.double(a))
}

LLC_f2 <- function(x, l, a) {
  if (length(l) > 1 | length(a) > 1) {
    stop("This toy example is restricted to singular values of the limit and attachment.")}
  out <- .Fortran("llc_f2", x = as.double(x), n = length(x), l = as.double(l),
                  a = as.double(a), llc = as.double(0))
  out$llc
}

