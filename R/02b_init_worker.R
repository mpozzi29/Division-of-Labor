initWorker <- function(n, allocation, p = NULL){
  if (is.null(p))
    p <- rep(1, length(allocation)) / length(allocation)
  
  if (sum(p) != 1)
    p <- sum(p / sum(p))
  
  tmp <- rep(allocation, n * p)
  
  if (length(tmp) < n) 
    tmp <- c(tmp, sample(allocation, n - length(tmp), replace = FALSE, prob = p))
  
  mat <- do.call(rbind,tmp)
  
  data.frame(ID = 1:n,
             Allocation = mat)
}
