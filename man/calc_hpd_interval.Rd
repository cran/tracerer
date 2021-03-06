% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_hpd_interval.R
\name{calc_hpd_interval}
\alias{calc_hpd_interval}
\title{Calculate the Highest Probability Density of an MCMC trace that
  has its burn-in removed}
\usage{
calc_hpd_interval(trace, proportion = 0.95)
}
\arguments{
\item{trace}{a numeric vector of parameter estimates obtained from
an MCMC run. Must have its burn-in removed}

\item{proportion}{the proportion of numbers within the interval.
For example, use 0.95 for a 95 percentage interval}
}
\value{
a numeric vector, with at index 1 the lower boundary of the
  interval, and at index 2 the upper boundary of the interval
}
\description{
Calculate the Highest Probability Density of an MCMC trace that
  has its burn-in removed
}
\examples{
estimates <- parse_beast_tracelog_file(
  get_tracerer_path("beast2_example_output.log")
)
tree_height_trace <- remove_burn_in(
  estimates$TreeHeight,
  burn_in_fraction = 0.1
)

# Values will be 0.453 and 1.816
calc_hpd_interval(tree_height_trace, proportion = 0.95)
}
\seealso{
The function \code{\link{remove_burn_in}} removes
  a burn-in.
  The Java code that inspired this function can be found here:
  \url{https://github.com/beast-dev/beast-mcmc/blob/98705c59db65e4f406a420bbade949aeecfe05d0/src/dr/stats/DiscreteStatistics.java#L317} # nolint URLs can be long
}
\author{
The original Java version of the algorithm was from J. Heled,
  ported to R and adapted by Richèl J.C. Bilderbeek
}
