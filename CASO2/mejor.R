setwd("C:/Users/MICHELLE/Desktop/CalidadDeHospitales")
mejor <- function(estado, resultado) {
    
    outcome <- read.csv("outcome-of-care-measures.csv",sep = ",")
    edo <- data.frame(levels(outcome[,7]))
    y <- nrow(edo)
    for (i in 1:y) {
        if (estado == edo[i,1]) {
            edo1 <- 1 
        }
    }
    
    if (edo1 != 1) { 
        stop("Estado invalido")
    }
    
    outcome2 <- subset(outcome, State == estado, select = c(2,7,11,17,23))
    outcome2[outcome2 == "Not Available"] <- NA
    
    if (resultado != "neumonia" & resultado !="falla" & resultado != "ataque") {
        stop("resultado invalido")
    } else if (resultado == "ataque") {
        resultado <- 3
        outcome3 <- na.omit(outcome2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
        x <- as.numeric(as.vector(outcome3))
        y <- min(x,na.rm = TRUE)
        y1 <- format(y, nsmall=1)
        best <- subset(outcome2,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == y1,Hospital.Name)
        as.vector(best[1,1])
    
    } else if (resultado == "neumonia") {
        resultado <- 5
        outcome3 <- na.omit(outcome2$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
        x <- as.numeric(as.vector(outcome2[,resultado]))
        y <- min(x,na.rm = TRUE)
        y1 <- format(y, nsmall=1)
        best <- subset(outcome2,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == y1,Hospital.Name)
        as.vector(best[1,1])
    } else if (resultado == "falla") {
        resultado <- 4
        outcome3 <- na.omit(outcome2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
        x <- as.numeric(as.vector(outcome2[,resultado]))
        y <- min(x,na.rm = TRUE)
        y1 <- format(y, nsmall=1)
        best <- subset(outcome2,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == y1,Hospital.Name)
        as.vector(best[1,1])
    } 
}
    mejor("MD","ataque")
    
