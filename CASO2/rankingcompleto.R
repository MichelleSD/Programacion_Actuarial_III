setwd("C:/Users/MICHELLE/Desktop/CalidadDeHospitales")

rankingcompleto <- function(resultado,num ="mejor"){
    
    pe <- vector("character")
    edos <- c()
    outcome <- read.csv("outcome-of-care-measures.csv",sep = ",")
    outcome[outcome == "Not Available"] <- NA

    
    if (resultado != "neumonia" & resultado !="falla" & resultado != "ataque") {
        stop("resultado invalido")
        break
    } else if (resultado == "ataque") {
        resultado1 <- 3
        outco <- subset(outcome,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack != "NA", select = c(2,7,11))
        
    } else if (resultado == "neumonia") {
        resultado1 <- 3
        outco <- subset(outcome,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia != "NA", select = c(2,7,23))
        
    } else if (resultado == "falla") {
        resultado1 <- 3
        outco <- subset(outcome,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure != "NA", select = c(2,7,17))
        
    }
    
    outcome2 <- outco[order(outco$Hospital.Name),]
    x <- levels(outcome2$State)
    y <- length(x)
     for (estado in 1:y) {
         nuevo <- subset(outcome2,State == x[estado], select = c(1:3))
         nuevorden <- nuevo[order(nuevo[,3],nuevo[,1]),]
         
         if (num=="peor"){
             
             j <- as.numeric(as.vector(nuevorden[,3]))
             t <- max(j,na.rm = TRUE)
             t1 <- format(t, nsmall=1)
             worst <- subset(nuevorden,nuevorden[,3] == t1,Hospital.Name)
             hospital2 <- as.vector(worst[1,1])
             pe <- c(pe,as.vector(worst[1,1]))
             
            
         }else if(num=="mejor"){
             
             j <- as.numeric(as.vector(nuevorden[,3]))
             t <- min(j,na.rm = TRUE)
             t1 <- format(t, nsmall=1)
             best <- subset(nuevorden,nuevorden[,3] == t1,Hospital.Name)
             hospital2 <- as.vector(best[1,1])
             pe <- c(pe,hospital2)
            
         }else {
             hospital<-nuevorden[num,1]
             hospital2 <- as.vector(hospital)
             pe <- c(pe,hospital2)  
         }
         edos <- c(edos, x[estado])
     }
    dataa <- data.frame(pe,edos)
    colnames(dataa) <- c("hospital", "state")
    rownames(dataa)<- x
    dataa   
    
}

head(rankingcompleto("ataque", 20), 10)
tail(rankingcompleto("neumonia", "peor"), 3)
tail(rankingcompleto("falla"), 10)

