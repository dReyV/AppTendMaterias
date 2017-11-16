#############################################################################################################
############################################PREÁMBULO########################################################
rm(list = ls()) #instrucción para limpiar la memoria de trabajo
library(utils) #cargue de la librería "utils" para utilizar la función de importación de datos .csv
library(data.table) #cargue de la librería "data.table" para manejo de datos tipo data.frame
#############################################################################################################
####################################CARGUE DE DATOS LOCAL####################################################
#1. Carga de datos: X_[materia]_[periodo]_h[hipotesis]
ruta="~/Escritorio/DataMateriasCsv/" #ruta de las notas de las materias en equipo local
#ruta="DataMateriasCsv/" #Ruta para ejecución con Knitr, carpeta en mismo directorio
#Materia 1 --> se importan los archivos .csv de esta materia y se cargan en memoria de Rstudio
#H1 --> Hipótesis 1 = estudiantes aprobados
X_1_20151_h1=read.csv(paste0(ruta,"X_1_20151_h1.csv"), header = FALSE) 
X_1_20152_h1=read.csv(paste0(ruta,"X_1_20152_h1.csv"), header = FALSE)
X_1_20161_h1=read.csv(paste0(ruta,"X_1_20161_h1.csv"), header = FALSE)
#H2 --> Hipótesis 2 = estudiantes reprobados
X_1_20151_h2=read.csv(paste0(ruta,"X_1_20151_h2.csv"), header = FALSE)
X_1_20152_h2=read.csv(paste0(ruta,"X_1_20152_h2.csv"), header = FALSE)
X_1_20161_h2=read.csv(paste0(ruta,"X_1_20161_h2.csv"), header = FALSE)
#Hx --> Datos de prueba para clasificar
X_1_20162=read.csv(paste0(ruta,"X_1_20162.csv"), header = FALSE)
#Materia 2 --> se importan los archivos .csv de esta materia y se cargan en memoria de Rstudio
#H1 --> Hipótesis 1 = estudiantes aprobados
X_2_20151_h1=read.csv(paste0(ruta,"X_2_20151_h1.csv"), header = FALSE)
X_2_20152_h1=read.csv(paste0(ruta,"X_2_20152_h1.csv"), header = FALSE)
X_2_20161_h1=read.csv(paste0(ruta,"X_2_20161_h1.csv"), header = FALSE)
#H2 --> Hipótesis 2 = estudiantes reprobados
X_2_20151_h2=read.csv(paste0(ruta,"X_2_20151_h2.csv"), header = FALSE)
X_2_20152_h2=read.csv(paste0(ruta,"X_2_20152_h2.csv"), header = FALSE)
X_2_20161_h2=read.csv(paste0(ruta,"X_2_20161_h2.csv"), header = FALSE)
#Hx --> Datos de prueba para clasificar
X_2_20162=read.csv(paste0(ruta,"X_2_20162.csv"), header = FALSE)
#Materia 3 --> se importan los archivos .csv de esta materia y se cargan en memoria de Rstudio
#H1 --> Hipótesis 1 = estudiantes aprobados
X_3_20151_h1=read.csv(paste0(ruta,"X_3_20151_h1.csv"), header = FALSE)
X_3_20152_h1=read.csv(paste0(ruta,"X_3_20152_h1.csv"), header = FALSE)
X_3_20161_h1=read.csv(paste0(ruta,"X_3_20161_h1.csv"), header = FALSE)
#H2 --> Hipótesis 2 = estudiantes reprobados
X_3_20151_h2=read.csv(paste0(ruta,"X_3_20151_h2.csv"), header = FALSE)
X_3_20152_h2=read.csv(paste0(ruta,"X_3_20152_h2.csv"), header = FALSE)
X_3_20161_h2=read.csv(paste0(ruta,"X_3_20161_h2.csv"), header = FALSE)
#Hx --> Datos de prueba para clasificar
X_3_20162=read.csv(paste0(ruta,"X_3_20162.csv"), header = FALSE)
#Materia 4 --> se importan los archivos .csv de esta materia y se cargan en memoria de Rstudio
#H1 --> Hipótesis 1 = estudiantes aprobados
X_4_20151_h1=read.csv(paste0(ruta,"X_4_20151_h1.csv"), header = FALSE)
X_4_20152_h1=read.csv(paste0(ruta,"X_4_20152_h1.csv"), header = FALSE)
X_4_20161_h1=read.csv(paste0(ruta,"X_4_20161_h1.csv"), header = FALSE)
#H2 --> Hipótesis 2 = estudiantes reprobados
X_4_20151_h2=read.csv(paste0(ruta,"X_4_20151_h2.csv"), header = FALSE)
X_4_20152_h2=read.csv(paste0(ruta,"X_4_20152_h2.csv"), header = FALSE)
X_4_20161_h2=read.csv(paste0(ruta,"X_4_20161_h2.csv"), header = FALSE)
#Hx --> Datos de prueba para clasificar
X_4_20162=read.csv(paste0(ruta,"X_4_20162.csv"), header = FALSE)
##
#############################################################################################################
##########################################VARIABLES GLOBALES#################################################
min_data = 0 #nota mínima
max_data = 50 #nota máxima
step_data = 1 #paso de incremento para las notas
##
#############################################################################################################
###################################ANÁLISIS DE DISCRIMINANTE LINEAL##########################################
#########se programa la cantidad de iteraciones según el número de materias disponibles######################
for(materia_i in 1:4){
  if(materia_i==1){ # Seleccion de datos según materia para cargar matrices X_h1, X_h2 y X_x
    X_h1 = rbind(X_1_20151_h1, X_1_20152_h1, X_1_20161_h1) #concatenar los vectores hipótesis 1 por filas
    X_h2 = rbind(X_1_20151_h2, X_1_20152_h2, X_1_20161_h2) #concatenar los vectores hipótesis 2 por filas
    X_x=X_1_20162 #vector de notas de prueba para clasificar
  }else{
    if(materia_i==2){ # Seleccion de datos según materia para cargar matrices X_h1, X_h2 y X_x
      X_h1 = rbind(X_2_20151_h1, X_2_20152_h1, X_2_20161_h1) #concatenar los vectores hipótesis 1 por filas
      X_h2 = rbind(X_2_20151_h2, X_2_20152_h2, X_2_20161_h2) #concatenar los vectores hipótesis 2 por filas
      X_x=X_2_20162 #vector de notas de prueba para clasificar
    }else{
      if(materia_i==3){ # Seleccion de datos según materia para cargar matrices X_h1, X_h2 y X_x
        X_h1 = rbind(X_3_20151_h1, X_3_20152_h1, X_3_20161_h1) #concatenar los vectores hipótesis 1 por filas
        X_h2 = rbind(X_3_20151_h2, X_3_20152_h2, X_3_20161_h2) #concatenar los vectores hipótesis 2 por filas
        X_x=X_3_20162 #vector de notas de prueba para clasificar
      }else{
        X_h1 = rbind(X_4_20151_h1, X_4_20152_h1, X_4_20161_h1) #concatenar los vectores hipótesis 1 por filas
        X_h2 = rbind(X_4_20151_h2, X_4_20152_h2, X_4_20161_h2) #concatenar los vectores hipótesis 2 por filas
        X_x=X_4_20162 #vector de notas de prueba para clasificar
      }
    }
  }
  #############################Cálculo de las esperanzas de las variables aleatorias###############################
  mu_X_h1 =c(mean(X_h1$V1), mean(X_h1$V2)) #cálculo de la media por cada vector de Nota1 y Nota2 de la hipótesis H1
  mu_X_h1=as.data.frame(mu_X_h1) #conversión de la matriz a tipo de dato data.frame
  mu_X_h1=t(mu_X_h1) #cálculo de la matriz transpuesta
  mu_X_h2 =c(mean(X_h2$V1), mean(X_h2$V2)) #cálculo de la media por cada vector de Nota1 y Nota2 de la hipótesis H2
  mu_X_h2=as.data.frame(mu_X_h2) #conversión de la matriz a tipo data.frame
  mu_X_h2=t(mu_X_h2) #cálculo de la matriz transpuesta
  ###########################################Cálculo de las matrices de covarianza#################################
  Q_X_h1 =cov(X_h1) #covarianza H1
  Q_X_h2 =cov(X_h2) #covarianza H2
  #Matriz de covarianza promedio total
  Q_X_T = (Q_X_h1+Q_X_h2)/2
  ###########################################Cálculo de coeficientes regla de decision##############################
  w = (mu_X_h1-mu_X_h2)%*%solve(Q_X_T) #cálculos para entontrar matriz de coeficientes W
  w=as.vector(w) #conversión a tipo de dato vector
  c = (mu_X_h1%*%solve(Q_X_T)%*%t(mu_X_h1) - mu_X_h2%*%solve(Q_X_T)%*%t(mu_X_h2))/2 #cálculos para encontrar los coeficientes C
  c=as.vector(c) #conversión a tipo de dato vector
  x1_LDA = c(min_data:max_data) #conjunto de puntos eje X
  x2_LDA = ((-w[1]/w[2])*x1_LDA)+(c/w[2]) #conjunto de puntos eje Y
  ##################################### Grafica de tendencia de materia histórico y regla de decisión###########################
  plot(X_h1$V1, X_h1$V2, xlab = "Nota 1", ylab = "Nota 2", pch=8, col="green", cex=0.7 , xlim=c(0 , 50), ylim=c(0 , 50)) #dibuja los puntos de las hipótesis h1
  lines(x1_LDA, x2_LDA ,col="red") #dibuja la línea del discriminante lineal
  points(X_h2$V1, X_h2$V2, pch=8, col="blue", cex=0.7) #diguja los puntos de las hipótesis h2
  title(main=paste0('Tendencia Materia ',as.character(materia_i))) #coloca el título a la gráfica
  legend(43, 45,  #establecer los parámetros de la leyenda de la hipótesis 1
         legend = c(paste0("H1->Aprobar")), #mensaje de aprobar
         cex=0.7, #anchura del punto
         pch=8, col="green", #tipo y color de punto
         xjust = 0, yjust = 0) #ajuste de coordenadas de visualización
  legend(0, 0,  #establecer los parámetros de la leyenda de la hipótesis 2
         legend = c(paste0("H2->Reprobar")), #mensaje de reprobar       
         cex=0.7, #anchura del punto
         pch=8, col="blue", #tipo y color de punto
         xjust = 0, yjust = 0) #ajuste de coordenadas de visualización
  grid() #dibujar la grilla en la gráfica
  #################################Evaluacion de datos actuales con regla de decisión##########################
  X_x_h1 = c() #inicializa el vector hipótesis 1 en vacío
  X_x_h2 = c() #inicializa el vector hipótesis 2 en vacío
  X_regla = ((-w[1]*t(X_x[,1])/w[2])+c/w[2])-t(X_x[,2]) #calculo de la diferencia entre los puntos de la recta y los datos de prueba
  row_X_xR=nrow(X_regla) #número de filas del vector de diferencias
  col_X_xR=ncol(X_regla) #número de columnas del vector de diferencias
  for(i in 1:col_X_xR){
    if(X_regla[i]>=0){ # si dif>=0 => H1->Reprobado
      X_x_h2 = rbind(X_x_h2, c(X_x[i,1], X_x[i,2]))#--Estudiantes Reprobados
    }else{
      X_x_h1 = rbind(X_x_h1, c(X_x[i,1], X_x[i,2]))#--Estudiantes Aprobados
    }
  }
  row_X_x_h1=nrow(X_x_h1) #Cantidad estudiantes Aprobados
  row_X_x_h2=nrow(X_x_h2) #Cantidad estudiantes Reprobados
  row_X_x=nrow(X_x) #Cantidad total de estudiantes
  p_X_x_h1 = 100*row_X_x_h1/row_X_x #Porcentaje estudiantes Aprobados
  p_X_x_h2 = 100*row_X_x_h2/row_X_x #Porcentaje estudiantes Reprobados
  ###############################################################################################
  ###########################Impresión de resultados en pantalla################################
  print(paste0("Materia: ", as.character(materia_i))) #imprimir el nombre de la materia
  print(paste0("Estudiantes aprobados: ", as.character(row_X_x_h1))) #imprimir cantidad estudiantes aprobados
  print(paste0("Estudiantes reprobados: ", as.character(row_X_x_h2))) #imprimir cantidad estudiantes reprobados
  print(paste0("Porcentaje estudiantes aprobados: ", as.character(p_X_x_h1)))  #imprimir porcentaje estudiantes aprobados
  print(paste0("Porcentaje estudiantes reprobados: ", as.character(p_X_x_h2)))  #imprimir porcentaje estudiantes reprobados
  print("///////////////////////////////////////") #imprime separador de mensajes entre materias
  ############################Grafica pronóstico total de materia################################
  #imprime puntos de los datos clasificados como aprobados en color verde
  plot(X_x_h1[,1], X_x_h1[,2], xlab = "Nota 2", ylab = "Nota 1", pch=8, col="green", cex=0.7 , xlim=c(0 , 50), ylim=c(0 , 50))
  lines(x1_LDA, x2_LDA ,col="red") #imprime la recta del discriminante lineal en color rojo
  points(X_x_h2[,1], X_x_h2[,2], pch=8, col="blue", cex=0.7) #imprime los puntos de los datos clasificados como reprobados en color azul
  title(main=paste0('Pronóstico Materia ',as.character(materia_i))) #imprime encabezado de la gráfica
  legend(43, 45, #imprime etiqueta para hipótesis de aprobado en color verde
         legend = c(paste0("Aprueban: ",as.character(row_X_x_h1))), #imprime en la etiqueta la cantidad de aprobados
         cex=0.7, #anchura del punto
         pch=8, col="green", #imprime símbolo de aprobados con color verde
         xjust = 0, yjust = 0)
  legend(0, 0, #imprime etiqueta para hipótesis de reprobado en color azul
         legend = c(paste0("Reprueban: ",as.character(row_X_x_h2))), #imprime en la etiqueta la cantidad de reprobados       
         cex=0.7, #anchura del punto
         pch=8, col="blue", #imprime símbolo de reprobados con color azul 
         xjust = 0, yjust = 0)
  grid() #dibujar la grilla en la gráfica
}

  
  
