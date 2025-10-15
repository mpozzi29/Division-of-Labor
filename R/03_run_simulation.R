# Load the setup scripts and function definitions
source("01_setup_conditions.R")
source("02a_init_task.R")
source("02b_init_worker.R")
for (k in 1:nrow(ConditionsTable)){
  Tasks_0 <- initTask(n = ConditionsTable$NT[k], types = c("A", "B", "C"))
  Workers <- initWorker(n = ConditionsTable$NW[k], allocation = list(c(1/3, 1/3, 1/3), 
                                                                     c(1, 0, 0), 
                                                                     c(0, 1, 0), 
                                                                     c(0, 0, 1)), 
                        p = c(ConditionsTable$Ratio[k],
                              (1-ConditionsTable$Ratio[k])/3,
                              (1-ConditionsTable$Ratio[k])/3,
                              (1-ConditionsTable$Ratio[k])/3))
  
  TotalPerformance = NULL
  for (j in 1:100){
    Tasks <- Tasks_0 
    Performance <- sum(Tasks$Completion >= 1, na.rm=TRUE)
    while (!all(Tasks$Completion >= 1)) {
      index = sample(1:nrow(Tasks), nrow(Workers), replace = TRUE, prob = Tasks$Completion < 1)
      
      for (i in 1:nrow(Workers)) {
        if (Tasks$Type[index[i]] == "A") {
          Tasks$Completion[index[i]] <- Tasks$Completion[index[i]] + Workers$Allocation.1[i]
        } else if (Tasks$Type[index[i]] == "B") {
          Tasks$Completion[index[i]] <- Tasks$Completion[index[i]] + Workers$Allocation.2[i]
        } else if (Tasks$Type[index[i]] == "C") {
          Tasks$Completion[index[i]] <- Tasks$Completion[index[i]] + Workers$Allocation.3[i]
        }
      }
      
      Performance <- c(Performance, sum(Tasks$Completion >= 1, na.rm=TRUE))
      
    }
    
    PerformanceTable <- data.frame(Time = 0:(length(Performance) - 1),
                                   Replicate = j,
                                   Performance)
    
    TotalPerformance <- rbind(TotalPerformance, PerformanceTable)
    
    print(j)
  }
  
  #library(ggplot2)
  #Plot <- ggplot(TotalPerformance, aes(x = Time, y = Performance, group = Replicate)) + geom_line()
  
  write.csv(TotalPerformance, file = sprintf("../data/Condition_%s.csv", k), row.names = FALSE)
}
