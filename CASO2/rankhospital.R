setwd("C:/Users/MICHELLE/Desktop/CalidadDeHospitales")

rankhospital <- function(estado,resultado, num = "best") {
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
    resultado1 <- 3
    outco <- subset(outcome2,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack != "NA", select = c(1:3))
    
} else if (resultado == "neumonia") {
    resultado1 <- 3
    outco <- subset(outcome2,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia != "NA", select = c(1,2,5))
    
} else if (resultado == "falla") {
    resultado1 <- 3
    outco <- subset(outcome2,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure != "NA", select = c(1,2,4))
    
} 
outcome3 <- outco[order(outco$Hospital.Name),]
best <- outcome3[order(outcome3[,resultado1],outcome3[,2],decreasing = FALSE),]
     if (num == "mejor"){
        Rank <- rank(order(best[,resultado1]))
        best1 <- cbind(best,Rank)
        x <- subset(best1, Rank == 1 ,Hospital.Name)
        as.vector(x[1,1])
        
    } else if (num == "peor") {
        Rank <- rank(order(best[,resultado1]))
        best1 <- cbind(best,Rank)
        x <- subset(best1, Rank == nrow(best1) ,Hospital.Name)
        as.vector(x[1,1])
        } else if (num > nrow(best)) {
            x <- "NA"
            x
        } else {
        Rank <- rank(order(best[,resultado1]))
        best1 <- cbind(best,Rank)
        x <- subset(best1, Rank == num ,Hospital.Name)
        as.vector(x[1,1])
    }
    
}


rankhospital("MD","ataque","peor")
