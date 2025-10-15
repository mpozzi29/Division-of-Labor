NT = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
NW = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
Ratio = c(0, 0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1)
ConditionsTable <- expand.grid(NT, NW, Ratio)
colnames(ConditionsTable) <- c("NT", "NW", "Ratio")
ConditionsTable <- ConditionsTable[!(ConditionsTable$NT < ConditionsTable$NW), ]
row.names(ConditionsTable) <- 1:nrow(ConditionsTable)