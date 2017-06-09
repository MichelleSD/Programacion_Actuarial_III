README
-------
#Autores#
###Jose Ricardo MUnguia Marin###
###Jessica Michelle Sanchez Dominguez###
###Ivanka Iztel Morales Lopez###
###Julio Adrian Bonilla Alarcon###

#INTRODUCCION#
###Varias compañias compiten para lograr logaritmos mas avanzados pra atraer a nuevos usuarios.Los siguientes datos provienen de los acelerometros ubicados en celulares Samsung  Galaxy S.###
###El siguiente codigo esta echo en una funcon para que a si no guarde las tablas y los resultados.###

##Parte 1 (Lectura de la tabla)##
###Para poder iniciar el codigo tenemos que unir una tabla sobre otra, hacemos que lea los dos documentos y los junte, de las dos bases de datos originales de prueba y entrenamientos.### 
###Despues etiquetamos las bases de datos de arriba que ya estan unidas###
###Y por ultimo ejecutamos las aaciones de los sujetos unidos###
```{r}
{
completoX <- rbind(read.table("./train/X_train.txt"), read.table("./test/X_test.txt"))
completoY <- rbind(read.table("./train/Y_train.txt"), read.table("./test/y_test.txt"))
completoSub <- rbind(read.table("./train/subject_train.txt"),  read.table("./test/subject_test.txt")) 

```
##Parte 2 (Datos Necesarios)
###En esta parte del codigo lo que se realiza es la separacion de los datos requeridos que en este caso serian MEAN y STD y tambien para omitir palabras de mas solo obtiene los datos que deben de ser###
```{r}
caract <- read.table("./features.txt")  
index <- grep("mean\\(\\)|std\\(\\)", caract[, 2])  
completoX <- completoX[,index]
}

```

##Parte 3 (Estetica de la Tabla)##
###Lo que hace la siguiente parte del codigo es quitar los parentesis a las caracteristicas que seran ahora las columnas, "Mean" lo escribe en mayusculas, a "std" la Primera letra la pone en mayuscula y los guines los convertimos en espacios.###
###Separamos las actividades quitamos los espacios y los convertimos en minusculas###

```{r}
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

```
##Parte 4 (Colocamos nombres a las columnas)##
###Colocamos el nombre a las difrentes columnas actividad sujeto y por ultimo loas datos permutados###

```{r}
names(completoY) <- "actividad" 
names(completoSub) <- "persona" 
datoslimpios <- cbind(completoSub, completoY, completoX) 


```
##Parte 5 (Tablas)##
###Hacemos una tabla de cuantas variables hay y que cantidad ha y de ellas, en este caso hay 30 variables y ver cuanto se repite cada una,vemos la cantidad de actividades que hay,notamos cantidad de caracteristicas, columnas que  hay en la base limpia,hay 180 filas(30 sujetos X 6 actividades) por 65 columnas de carateristicas que queremos.###
###Se llenan de NA para poder crearla vacia.##

```{r}
Npersonas <-length(levels(factor(data.matrix(completoSub)))) 
numact <- length(activ)
numcol <- ncol(datoslimpios) 
resultado <- as.data.frame(matrix(NA, nrow=Npersonas*numact, ncol=numcol))
colnames(resultado) <- colnames(datoslimpios) 

}
```

##Parte 6 ( permutaciones de filas y promedios)##
###Ordenamos los datos limpios y quitamos los datos vacios,ya teniendo esa informacion la ponemos en un vector y hacemos dos vectores vacios.###
###Luego con los ciclos for contabilizamos cuantos sumados nos tienen que dar.###
###Luego hace dos matrices menores por personas de acuerdo a las actividades.###
###Y por ultimo observa cuantas filas de la primera actividad tiene la primera persona y asi por 180 veces.###
###Exportamos la tabla y muestra el resultado.###

```{r}
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

  # Exporto la tabla a la carpeta
  write.table(abc, "Baselimpia.txt", row.name=FALSE)
  #muesto el resultado
  View(abc)
}
limpieza(carpeta ="UCI HAR Dataset")

```

