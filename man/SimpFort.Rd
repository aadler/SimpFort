\name{LLC_f}
\alias{LLC_f}
\title{Example function calling Fortran}
\usage{
LLC_f(x, l, a)
}
\arguments{
  \item{x}{Vector of losses}
  \item{l}{Layer limit}
  \item{a}{Layer attachment}
}
\description{
Calculates: \deqn{LLC = \sum_{i=0}^n {\max(0, \min(x_i - a, l))}}{LLC = SUM over x: max(0, min(x - a, l))}
}
\examples{
LLC_f(100000, 50000, 90000)       # Should return 10000
LLC_f(100000, 50000, 50000)       # Should return 50000
LLC_f(100000, 10000, 100000)      # Should return 0
}
