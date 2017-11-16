###############################################################################################################################################################
#################################################################################PREÁMBULO#####################################################################
# 01-LDA-app
rm(list = ls()) #instrucción para limpiar la memoria de trabajo
library(shiny) #cargue de librería "shiny" para crear aplicaciones web utilizando lenguaje R
library(utils) #cargue de la librería "utils" para utilizar la función de importación de datos .csv
library(data.table) #cargue de la librería "data.table" para manejo de datos tipo data.frame
library(httr) #cargue de la librería "httr" para permitir la comunicación con protoloclo HTTP
rutaHttr="http://tendenciamaterias.azurewebsites.net/?peticion=general&detalle=" #especificar la ruta de conexión con el web service
###############################################################################################################################################################
###########################################################################CARGUE DE DATOS LOCAL###############################################################
#1. Carga de datos: X_[materia]_[periodo]_h[hipotesis]
#Materia 1 --> se importan los archivos .csv de esta materia y se cargan en memoria de Rstudio
#H1 --> Hipótesis 1 = estudiantes aprobados
ConsRest=GET(paste0(rutaHttr,"X_1_20151_h1"), header = FALSE) #ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed") #le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE)) #convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]] #convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]] #convierte la columna 2 de la variable "Datos" a tipo numerico
X_1_20151_h1=Datos #asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_1_20152_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_1_20152_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_1_20161_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_1_20161_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

#H2 --> Hipótesis 2 = estudiantes reprobados

ConsRest=GET(paste0(rutaHttr,"X_1_20151_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_1_20151_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_1_20152_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_1_20152_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_1_20161_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_1_20161_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

#Hx --> Datos de prueba para clasificar
ConsRest=GET(paste0(rutaHttr,"X_1_20162"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_1_20162=Datos#asigna el contenido de "Datos" a esta nueva variable

#Materia 2
#H1 --> Hipótesis 1 = estudiantes aprobados
ConsRest=GET(paste0(rutaHttr,"X_2_20151_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_2_20151_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_2_20152_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_2_20152_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_2_20161_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_2_20161_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

#H2 --> Hipótesis 2 = estudiantes reprobados
ConsRest=GET(paste0(rutaHttr,"X_2_20151_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_2_20151_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_2_20152_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_2_20152_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_2_20161_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_2_20161_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

#Hx --> Datos de prueba para clasificar
ConsRest=GET(paste0(rutaHttr,"X_2_20162"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_2_20162=Datos#asigna el contenido de "Datos" a esta nueva variable

#Materia 3
#H1 --> Hipótesis 1 = estudiantes aprobados
ConsRest=GET(paste0(rutaHttr,"X_3_20151_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_3_20151_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_3_20152_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_3_20152_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_3_20161_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_3_20161_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

#H2 --> Hipótesis 2 = estudiantes reprobados
ConsRest=GET(paste0(rutaHttr,"X_3_20151_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_3_20151_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_3_20152_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_3_20152_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_3_20161_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_3_20161_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

#Hx --> Datos de prueba para clasificar
ConsRest=GET(paste0(rutaHttr,"X_3_20162"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_3_20162=Datos#asigna el contenido de "Datos" a esta nueva variable

#Materia 4
#H1 --> Hipótesis 1 = estudiantes aprobados
ConsRest=GET(paste0(rutaHttr,"X_4_20151_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_4_20151_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_4_20152_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_4_20152_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_4_20161_h1"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_4_20161_h1=Datos#asigna el contenido de "Datos" a esta nueva variable

#H2 --> Hipótesis 2 = estudiantes reprobados
ConsRest=GET(paste0(rutaHttr,"X_4_20151_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_4_20151_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_4_20152_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_4_20152_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

ConsRest=GET(paste0(rutaHttr,"X_4_20161_h2"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_4_20161_h2=Datos#asigna el contenido de "Datos" a esta nueva variable

#Hx --> Datos de prueba para clasificar
ConsRest=GET(paste0(rutaHttr,"X_4_20162"), header = FALSE)#ejecuta instrucción GET con la petición en la URL, luego almacena la respuesta en "ConRest"
info <- content(ConsRest, "parsed")#le da formato a la respuesa y la almacena en la variable "info"
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))#convierte la información a tipo de dato data.frame
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]#convierte la columna 1 de la variable "Datos" a tipo numerico
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]#convierte la columna 2 de la variable "Datos" a tipo numerico
X_4_20162=Datos#asigna el contenido de "Datos" a esta nueva variable
##
###############################################################################################################################################################
##############################################################################VARIABLES GLOBALES###############################################################
min_data = 0 #nota mínima
max_data = 50 #nota máxima
step_data = 1 #paso de incremento para las notas
##
###############################################################################################################################################################
######################################################################DEFINICIÓN INTERFAZ DE USUARIO (UI)######################################################
ui <- fluidPage( #función de Shiny para especificar los objetos de la interfaz de usuario

  headerPanel('Aplicacion tendencia materias', windowTitle = 'Aplicacion tendencia materias'), #Especificación del header panel, o panel de encabezado
  sidebarPanel( #especificación del panel lateral
    selectInput('opc', 'Seleccione la opcion', c("Tendencia", "Pronostico individual", "Pronostico total"), #especificación de entrada tipo menú desplegable
                selected = "Tendencia"),
    selectInput('mat', 'Seleccione la materia', c("Materia 1", "Materia 2", "Materia 3", "Materia 4"),  #especificación de entrada tipo menú desplegable
                selected = "Materia 1"),
    numericInput('not1', 'Nota 1', 0, #especificación de entrada numérica digitada por el usuario de la nota 1
                 min = 0, max = 50),
    numericInput('not2', 'Nota 2', 0, #especificación de entrada numérica digitada por el usuario de la nota 2
                 min = 0, max = 50),
    actionButton(inputId = "go", #botón de acción con el cual se calculan las estadísticas una vez pulsado
                 label = "Calcular"),
    tags$p( tags$strong("Hx=Datos de prueba")," -> (V1=nota 1, V2=nota 2)"), 
    verbatimTextOutput("stats3",placeholder = TRUE) # objeto para visualización de estadísticas de los datos de prueba
  
  ),
  
  mainPanel( #especificación del panel principal donde se visualizará las gráficas de tendencia y pronósticos
    plotOutput('plot1'), #función de salida de gráfica de tendencias
    tags$p( tags$strong("H1=Aprobar")," -> (V1=nota 1, V2=nota 2)"), 
    verbatimTextOutput("stats1", placeholder = TRUE), #objeto para visualización de estadísticas de los datos de la hipótesis H1
    tags$p( tags$strong("H2=Reprobar")," -> (V1=nota 1, V2=nota 2)"), 
    verbatimTextOutput("stats2",placeholder = TRUE) #objeto para visualización de estadísticas de los datos de la hipótesis H2
    
  )
  
)
###############################################################################################################################################################
##############################################################################DEFINICIÓN DEL SERVIDOR##########################################################
server <- function(input, output) { #función de Shiny para configurar el servidor
  dataOpcion=eventReactive(input$go, { #la función "eventReactive" permite que los cálculos solo se ejecuten cuando el evento "input$go" se presente)
    input$opc #lee la variable "opc" que guarda el tipo de operación a realizar
  })
  dataNotas=eventReactive(input$go, {#la función "eventReactive" permite que los cálculos solo se ejecuten cuando el evento "input$go" se presente)
    c(input$not1, input$not2) #se almacenan en el vector dataNotas las notas Nota 1 y Nota 2
  })
  dataMateria=eventReactive(input$go, {#la función "eventReactive" permite que los cálculos solo se ejecuten cuando el evento "input$go" se presente)
    input$mat #se almacena la materia seleccionada
  })
  X_h1R=eventReactive(input$go, {#la función "eventReactive" permite que los cálculos solo se ejecuten cuando el evento "input$go" se presente)
    if(dataMateria()=="Materia 1"){
      X_h1 = rbind(X_1_20151_h1, X_1_20152_h1, X_1_20161_h1) #si la materia es la 1 se construye el vector de la hipótesis 1
    }else{
      if(dataMateria()=="Materia 2"){
        X_h1 = rbind(X_2_20151_h1, X_2_20152_h1, X_2_20161_h1) #si la materia es la 2 se construye el vector de la hipótesis 1
      }else{
        if(dataMateria()=="Materia 3"){
          X_h1 = rbind(X_3_20151_h1, X_3_20152_h1, X_3_20161_h1) #si la materia es la 3 se construye el vector de la hipótesis 1
        }else{
          X_h1 = rbind(X_4_20151_h1, X_4_20152_h1, X_4_20161_h1) #si la materia es la 4 se construye el vector de la hipótesis 1
        }
      }
    }
    
  })
  X_h2R=eventReactive(input$go, {#la función "eventReactive" permite que los cálculos solo se ejecuten cuando el evento "input$go" se presente)
    if(dataMateria()=="Materia 1"){
      X_h2 = rbind(X_1_20151_h2, X_1_20152_h2, X_1_20161_h2)  #si la materia es la 1 se construye el vector de la hipótesis 2
    }else{
      if(dataMateria()=="Materia 2"){
        X_h2 = rbind(X_2_20151_h2, X_2_20152_h2, X_2_20161_h2) #si la materia es la 2 se construye el vector de la hipótesis 2
      }else{
        if(dataMateria()=="Materia 3"){
          X_h2 = rbind(X_3_20151_h2, X_3_20152_h2, X_3_20161_h2) #si la materia es la 3 se construye el vector de la hipótesis 2
        }else{
          X_h2 = rbind(X_4_20151_h2, X_4_20152_h2, X_4_20161_h2) #si la materia es la 4 se construye el vector de la hipótesis 2
        }
      }
    }
 
  })
  X_xR=eventReactive(input$go, {#la función "eventReactive" permite que los cálculos solo se ejecuten cuando el evento "input$go" se presente)
    if(dataMateria()=="Materia 1"){
      X_x=X_1_20162 #si la materia es la 1 se construye el vector de los datos de prueba
    }else{
      if(dataMateria()=="Materia 2"){
          X_x=X_2_20162 #si la materia es la 2 se construye el vector de los datos de prueba
      }else{
        if(dataMateria()=="Materia 3"){
          X_x=X_3_20162 #si la materia es la 3 se construye el vector de los datos de prueba
        }else{
          X_x=X_4_20162 #si la materia es la 4 se construye el vector de los datos de prueba
        }
      }
    }
  })
  
  output$plot1 <- renderPlot({ #la función render de Shiny genera la salida respectiva para la interfaz de usuario
    if(dataMateria()=="Materia 1"){
     
      X_h1 = rbind(X_1_20151_h1, X_1_20152_h1, X_1_20161_h1) #arma el vector de la hipótesis 1
      X_h2 = rbind(X_1_20151_h2, X_1_20152_h2, X_1_20161_h2) #arma el vector de la hipótesis 2
      X_x=X_1_20162 #arma el vector con los datos de prueba para ese periodo
      materia_i=1 #establece el indice de materia en 1
    }else{
      if(dataMateria()=="Materia 2"){
       
        X_h1 = rbind(X_2_20151_h1, X_2_20152_h1, X_2_20161_h1) #arma el vector de la hipótesis 1
        X_h2 = rbind(X_2_20151_h2, X_2_20152_h2, X_2_20161_h2) #arma el vector de la hipótesis 2
        X_x=X_2_20162 #arma el vector con los datos de prueba para ese periodo
        materia_i=2 #establece el indice de materia en 2
      }else{
        if(dataMateria()=="Materia 3"){
    
          X_h1 = rbind(X_3_20151_h1, X_3_20152_h1, X_3_20161_h1) #arma el vector de la hipótesis 1
          X_h2 = rbind(X_3_20151_h2, X_3_20152_h2, X_3_20161_h2) #arma el vector de la hipótesis 2
          X_x=X_3_20162 #arma el vector con los datos de prueba para ese periodo
          materia_i=3 #establece el indice de materia en 3
        }else{
          
          X_h1 = rbind(X_4_20151_h1, X_4_20152_h1, X_4_20161_h1) #arma el vector de la hipótesis 1
          X_h2 = rbind(X_4_20151_h2, X_4_20152_h2, X_4_20161_h2) #arma el vector de la hipótesis 2
          X_x=X_4_20162 #arma el vector con los datos de prueba para ese periodo
          materia_i=4 #establece el indice de materia en 4
        }
      }
    }
   
    #############################Cálculo de las esperanzas de las variables aleatorias###############################
    #Esperanzas
    mu_X_h1 =c(mean(X_h1$V1), mean(X_h1$V2)) #cálculo de la media por cada vector de Nota1 y Nota2 de la hipótesis H1
    mu_X_h1=as.data.frame(mu_X_h1) #conversión de la matriz a tipo de dato data.frame
    mu_X_h1=t(mu_X_h1) #cálculo de la matriz transpuesta
    mu_X_h2 =c(mean(X_h2$V1), mean(X_h2$V2)) #cálculo de la media por cada vector de Nota1 y Nota2 de la hipótesis H2
    mu_X_h2=as.data.frame(mu_X_h2)#conversión de la matriz a tipo de dato data.frame
    mu_X_h2=t(mu_X_h2) #cálculo de la matriz transpuesta
    ###########################################Cálculo de las matrices de covarianza#################################
    # Covarianzas
    Q_X_h1 =cov(X_h1)#covarianza H1
    Q_X_h2 =cov(X_h2)#covarianza H2
    #Matriz de covarianza promedio total
    # Covarianza promedio
    Q_X_T = (Q_X_h1+Q_X_h2)/2
    ###########################################Cálculo de coeficientes regla de decision##############################
    # Regla de decision
    w = (mu_X_h1-mu_X_h2)%*%solve(Q_X_T)  #cálculos para entontrar matriz de coeficientes W
    w=as.vector(w) #conversión a tipo de dato vector
    c = (mu_X_h1%*%solve(Q_X_T)%*%t(mu_X_h1) - mu_X_h2%*%solve(Q_X_T)%*%t(mu_X_h2))/2 #cálculos para encontrar los coeficientes C
    c=as.vector(c) #conversión a tipo de dato vector
    x1_LDA = c(min_data:max_data) #conjunto de puntos eje X 
    x2_LDA = ((-w[1]/w[2])*x1_LDA)+(c/w[2]) #conjunto de puntos eje Y
    ##################################### Grafica de tendencia de materia histórico y regla de decisión###########################
    if(dataOpcion()=="Tendencia"){
      # Grafica de materia historico y regla de decision
      plot(X_h1$V1, X_h1$V2, xlab = "Nota 1", ylab = "Nota 2", pch=8, col="green", cex=0.7 , xlim=c(0 , 50), ylim=c(0 , 50) ) #dibuja los puntos de las hipótesis h1
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
   ##################################### Grafica de pronóstico individual y regla de decisión###########################
    }else{
      if(dataOpcion()=="Pronostico individual"){
        plot.new() #crea un nuevo objeto de gráfica
        plot.window(xlim=c(0,50), ylim=c(0,50)) #diguja la ventaja de la gráfica, se estable el rango de cada eje
        lines(x1_LDA, x2_LDA ,col="red") #dibuja la línea del discriminante lineal
        axis(1) #establece eje 1
        axis(2) #establece eje 2
        title(xlab="Nota 1") #coloca título a eje X
        title(ylab="Nota 2") #coloca título a eje Y
        title(main=paste0('Pronostico Materia ',as.character(materia_i))) #coloca título a la gráfica
        box() #dibuja contorno de caja
        #calculo de la diferencia entre la recta del discriminante y el dato
        if((((-w[1]*dataNotas()[1]/w[2])+c/w[2])-dataNotas()[2])>=0){ #si la diferencia es >=0, entonces hipótesis 2->Reprobar
          points(dataNotas()[1], dataNotas()[2], pch=9, col="blue", cex=2.5) #dibuja punto de la Notas en color azul
          legend(0, 0, #configura la leyenda 
                 legend = c(paste0("H2->Reprobar")), #mensaje de reprobar
                 cex=0.7, #anchura del punto
                 pch=9, col="blue", #tipo y color de punto
                 xjust = 0, yjust = 0) #ajuste de coordenadas de visualización
        }else{ #si la diferencia es <0, entonces hipótesis 1->Aprobar
          points(dataNotas()[1], dataNotas()[2], pch=9, col="green", cex=2.5)
          legend(43, 45, #configura la leyenda 
                 legend = c(paste0("H1->Aprobar")), #mensaje de aprobar
                 cex=0.7, #anchura del punto
                 pch=9, col="green", #tipo y color de punto
                 xjust = 0, yjust = 0) #ajuste de coordenadas de visualización
        }
        grid() #dibujar la grilla en la gráfica
    ###########################################Evaluacion de datos de prueba con regla de decision#############################################
      }else{
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
        # Grafica pronostico total con datos de prueba de materia
        #dibuja punto de la hipótesis 1 en color verde
        plot(X_x_h1[,1], X_x_h1[,2], xlab = "Nota 2", ylab = "Nota 1", pch=8, col="green", cex=0.7 , xlim=c(0 , 50), ylim=c(0 , 50) )
        lines(x1_LDA, x2_LDA ,col="red") #dibuja la línea del discriminante lineal en rojo
        points(X_x_h2[,1], X_x_h2[,2], pch=8, col="blue", cex=0.7) #dibuja punto de la hipótesis 2 en color azul
        title(main=paste0('Pronostico Materia ',as.character(materia_i)," (",as.character(row_X_x)," est.)")) #título de la gráfica
        legend(43, 45, #configura la leyenda 
               legend = c(paste0("Aprueban: ",as.character(row_X_x_h1))),  #mensaje cantidad aprobados
               cex=0.7, #anchura del punto
               pch=8, col="green", #tipo y color de punto  
               xjust = 0, yjust = 0) #ajuste de coordenadas de visualización
        legend(0, 0, #configura la leyenda 
               legend = c(paste0("Reprueban: ",as.character(row_X_x_h2))),  #mensaje cantidad reprobados
               cex=0.7, #anchura del punto
               pch=8, col="blue", #tipo y color de punto
               xjust = 0, yjust = 0) #ajuste de coordenadas de visualización
        grid() #dibujar la grilla en la gráfica
      }
    }
  })
  output$stats1 <- renderPrint({ #renderiza la gráfica respectiva solicitada
    summary(X_h1R()) #calcula estádisticas básicas de la hipótesis 1
  })
  output$stats2 <- renderPrint({ #renderiza la gráfica respectiva solicitada
    summary(X_h2R()) #calcula estádisticas básicas de la hipótesis 2
  })
  output$stats3 <- renderPrint({ #renderiza la gráfica respectiva solicitada
    summary(X_xR()) #calcula estádisticas básicas de los datos de prueba
  })

}
shinyApp(ui = ui, server = server) #línea de código especificada por Shiny para configurar la aplicación
