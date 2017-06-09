---
title: "Code Book"
output:
  pdf_document: default
  
---

##**CASO 3**

#### *Introducci�n* Aqu� vamos a describir las variables, base de datos y transformaciones que se realizaron.

###El conjunto de datos incluye los siguientes archivos:

*features_info.txt': Muestra informaci�n sobre las variables utilizadas en el vector de caracter�sticas.

*features.txt': Lista de todas las funciones.

*activity_labels.txt': Enlaza las etiquetas de clase con su nombre de actividad.

*train / X_train.txt': Conjunto de entrenamiento.

*train / y_train.txt': Etiquetas de entrenamiento.

*test / X_test.txt': Conjunto de pruebas.

*test / y_test.txt': Prueba de etiquetas.

#### *Variables* Las variables elegidas en la base de datos provienen del aceler�metro y giroscopio de los celulares en 3 ejes, las se�ales se usaron para generar variables para los vectores X,Y y Z

*tBodyAcc-XYZ

*tGravityAcc-XYZ

*tBodyAccJerk-XYZ

*tBodyGyro-XYZ

*tBodyGyroJerk-XYZ

*tBodyAccMag

*tGravityAccMag

*tBodyAccJerkMag

*tBodyGyroMag

*tBodyGyroJerkMag

*fBodyAcc-XYZ

*fBodyAccJerk-XYZ

*fBodyGyro-XYZ

*fBodyAccMag

*fBodyAccJerkMag

*fBodyGyroMag

*fBodyGyroJerkMag

Y las se�ales derivadas de estas variables fueron:

*mean(): Media

*std(): Desviaci�n estandar

*mad(): Desviaci�n media absoluta

*max(): Valor m�s grande de los datos

*min(): Valor m�s pequ�o de los datos

*sma(): Signal magnitude area

*energy(): Medici�n de energ�a

*iqr(): Rango intercuartil

*entropy(): Se�al de entropia

*arCoeff(): Coeficiente de autorregresion con orden igual a 4

*correlation(): Coeficiente de correlaci�n entrre dos se�ales

*maxInds(): �ndice de coeficiente de frecuencia con la magnitud m�s grande

*meanFreq(): Coeficientes de frecuencia para obtener la frecuencia media

*skewness(): Oblicuidad de la se�al de la frecuencia

*kurtosis(): Curtosis de la se�al de la frecuencia

*bandsEnergy(): Energia de un intervalo de frecuencia bajo la funci�n FFT

*angle(): Angulo entre dos vectores



La lista de varibales completa se encuentra en: "features.txt"

#### *Base de Datos* Los experimentos se han llevado a cabo con un grupo de 30 voluntarios dentro de un grupo de edad de 19-48 a�os. Cada persona realiz� seis actividades (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) con un tel�fono inteligente (Samsung Galaxy S II) en la cintura. Utilizando su aceler�metro y giroscopio incorporados, captamos la aceleraci�n lineal 3-axial y la velocidad angular 3-axial a una velocidad constante de 50Hz. Los experimentos se han grabado en video para etiquetar los datos manualmente. El conjunto de datos obtenido ha sido dividido aleatoriamente en dos series, donde se seleccion� el 70% de los voluntarios para generar los datos de entrenamiento y el 30% de los datos de la prueba.

Para la base de datos y m�s informaci�n:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### *Transformaciones*

1. Unir los datos de test con los de training, para crear un solo conjunto de datos
2. Extrae �nicamente las medidas de media y desviaci�n est�ndar de cada medici�n 3.Usa nombres de actividad para describir los nombres de las actividades en la base de datos
3. Coloca etiquetas apropiadas en la base de datos con nombres de variables que las describan.
4. Con los datos del paso 4, crea una segunda base de datos independiente con el promedio de cada variable para cada actividad y cada sujeto.