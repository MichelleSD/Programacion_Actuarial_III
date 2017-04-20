
corr <- function(directorio = "C:/Users/MICHELLE/Documents/specdata", horizonte=0) {
    #setwd("~/specdata")
    setwd(directorio)
    
    id <- 1:332
    vector1 <- c()
    for (i in id) {
        
        id2 <- formatC(i,width =3,flag="0") #le da formato para abrir el archivo
        readid <- read.csv(paste(id2,".csv",sep=""),header=TRUE,sep =",")
        
        corre <-subset(readid,complete.cases(readid) , select = c(sulfate,nitrate))
        #con la funcion subset crea un data frame de readid, con la condicion
        # que sean casos completos y solo coloque la columna de sulfato y nitrato
        ch <- nrow(corre)
        if (ch > horizonte) {
            y <- cor(corre$sulfate,corre$nitrate)
            vector1 <- c(vector1,y)
        }
    }
    vector1
}

corr(,400)


