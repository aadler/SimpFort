LLC_f <- function(x, l, a) {
  if (!is.double(x)) {storage.mode(x) <- 'double'}
  if (length(l) > 1 | length(a) > 1) {
    stop("This toy example is restricted to singular values of the limit and attachment.")}
  if (!is.double(l)) {storage.mode(l) <- 'double'}
  if (!is.double(a)) {storage.mode(a) <- 'double'}
  .Call(c_llc_f, x, l, a)
}
