initTask <- function(n, types, p = NULL) {
  if (is.null(p)) 
    p <- rep(1, length(types)) / length(types)
  
  if (sum(p) != 1)
    p <- sum(p / sum(p))
  
  tmp <- rep(types, n * p)
  
  if (length(tmp) < n) 
    tmp <- c(tmp, sample(types, n - length(tmp), replace = FALSE, prob = p))
  
  data.frame(ID = 1:n,
             Completion = 0,
             Type = tmp)
}