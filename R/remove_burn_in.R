#' Removed the burn-in from a trace
#' @param trace the values
#' @param burn_in_fraction the fraction that needs to be removed, must be [0,1>
#' @return the values with the burn-in removed
#' @export
#' @examples
#' # Create a trace from one to and including ten
#' v <- seq(1, 10)
#'
#' # Remove the first ten percent of its values,
#' # in this case removes the first value, which is one
#' w <- remove_burn_in(trace = v, burn_in_fraction = 0.1)
#' @author Richèl J.C. Bilderbeek
remove_burn_in <- function(trace, burn_in_fraction) {
  tracerer::check_trace(trace)
  if (burn_in_fraction < 0.0) {
    stop("'burn_in_fraction' must be at least zero")
  }
  if (burn_in_fraction > 1.0) {
    stop("'burn_in_fraction' must be one at most")
  }
  n <- length(trace)
  first_index <- as.integer(1 + (n * burn_in_fraction))
  if (first_index >= length(trace)) {
    return(c())
  }
  trace[seq(first_index, n)]
}
