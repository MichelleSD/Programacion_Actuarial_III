limpieza<-function(carpeta ="~/UCI HAR Dataset"){

    #setwd(carpeta)
{
completoX <- rbind(read.table("./train/X_train.txt"), read.table("./test/X_test.txt")) 
completoY <- rbind(read.table("./train/Y_train.txt"), read.table("./test/y_test.txt")) 
completoSub <- rbind(read.table("./train/subject_train.txt"),  read.table("./test/subject_test.txt")) 

caract <- read.table("./features.txt")  
index <- grep("mean\\(\\)|std\\(\\)", caract[, 2])   
completoX <- completoX[,index]
}

{

names(completoX) <- gsub("\\(\\)", "", caract[index, 2]) 
names(completoX) <- gsub("mean", "Mean", names(completoX)) 
names(completoX) <- gsub("std", "Std", names(completoX)) 
names(completoX) <- gsub("-", " ", names(completoX)) 

activity <- read.table("./activity_labels.txt")
activity[, 2] <- tolower(gsub("_", " ", activity[, 2])) 

substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8)) 
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8)) 
activ <- as.character(activity[,2])

names(completoY) <- "actividad" 
names(completoSub) <- "persona" 
datoslimpios <- cbind(completoSub, completoY, completoX) 

Npersonas <-length(levels(factor(data.matrix(completoSub)))) 
numact <- length(activ)     
numcol <- ncol(datoslimpios)  

resultado <- as.data.frame(matrix(NA, nrow=Npersonas*numact, ncol=numcol)) 
colnames(resultado) <- colnames(datoslimpios) 

}
  {
  cuak <-  datoslimpios[order(datoslimpios[,1], datoslimpios[,2], na.last=NA),]
  dad<-c()
  datp<-as.vector(table(cuak[,1]))
  datq<-c(1,datp[1:29])
  actividad<-c()
  persona <- c()
y<-datp[1]
for(a in  1:30){
  x<-sum(datp[1:a])
  y<-sum(datq[1:a])
  datb<-table(cuak[x:y,2])
  dad<-c(dad,datb)
  actividad<-c(actividad,activ[c(1:6)])
  persona <-c(persona,c(a,a,a,a,a,a))
  }

acumulado<-colMeans(cuak[1:dad[1],3:68])

  for(a in 2:180){
    nacho<-sum(dad[1:a-1])+1
    b<-sum(dad[1:a])
    acumulado<-rbind(acumulado,colMeans(cuak[nacho:b,3:68]))
  }

res<-cbind(persona,actividad,acumulado)
abc<-data.frame(res,row.names = NULL)
}

  write.table(abc, "Baselimpia.txt", row.name=FALSE)
  
  View(abc)
}

limpieza("~/UCI HAR Dataset")
