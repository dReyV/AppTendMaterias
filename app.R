# 01-LDA-app
rm(list = ls())
library(shiny)
library(readr)
library(data.table)
library(httr)

rutaHttr="http://tendenciamaterias.azurewebsites.net/?peticion=general&detalle="

#1. Carga de datos: X_[materia]_[periodo]_h[hipotesis]
#Materia 1
#H1
ConsRest=GET(paste0(rutaHttr,"X_1_20151_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_1_20151_h1=Datos

ConsRest=GET(paste0(rutaHttr,"X_1_20152_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_1_20152_h1=Datos

ConsRest=GET(paste0(rutaHttr,"X_1_20161_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_1_20161_h1=Datos

#H2

ConsRest=GET(paste0(rutaHttr,"X_1_20151_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_1_20151_h2=Datos

ConsRest=GET(paste0(rutaHttr,"X_1_20152_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_1_20152_h2=Datos

ConsRest=GET(paste0(rutaHttr,"X_1_20161_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_1_20161_h2=Datos

#Hx
ConsRest=GET(paste0(rutaHttr,"X_1_20162"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_1_20162=Datos

#Materia 2
#H1
ConsRest=GET(paste0(rutaHttr,"X_2_20151_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_2_20151_h1=Datos

ConsRest=GET(paste0(rutaHttr,"X_2_20152_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_2_20152_h1=Datos

ConsRest=GET(paste0(rutaHttr,"X_2_20161_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_2_20161_h1=Datos

#H2
ConsRest=GET(paste0(rutaHttr,"X_2_20151_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_2_20151_h2=Datos

ConsRest=GET(paste0(rutaHttr,"X_2_20152_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_2_20152_h2=Datos

ConsRest=GET(paste0(rutaHttr,"X_2_20161_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_2_20161_h2=Datos

#Hx
ConsRest=GET(paste0(rutaHttr,"X_2_20162"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_2_20162=Datos

#Materia 3
#H1
ConsRest=GET(paste0(rutaHttr,"X_3_20151_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_3_20151_h1=Datos

ConsRest=GET(paste0(rutaHttr,"X_3_20152_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_3_20152_h1=Datos

ConsRest=GET(paste0(rutaHttr,"X_3_20161_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_3_20161_h1=Datos

#H2
ConsRest=GET(paste0(rutaHttr,"X_3_20151_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_3_20151_h2=Datos

ConsRest=GET(paste0(rutaHttr,"X_3_20152_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_3_20152_h2=Datos

ConsRest=GET(paste0(rutaHttr,"X_3_20161_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_3_20161_h2=Datos

#Hx
ConsRest=GET(paste0(rutaHttr,"X_3_20162"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_3_20162=Datos

#Materia 4
#H1
ConsRest=GET(paste0(rutaHttr,"X_4_20151_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_4_20151_h1=Datos

ConsRest=GET(paste0(rutaHttr,"X_4_20152_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_4_20152_h1=Datos

ConsRest=GET(paste0(rutaHttr,"X_4_20161_h1"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_4_20161_h1=Datos

#H2
ConsRest=GET(paste0(rutaHttr,"X_4_20151_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_4_20151_h2=Datos

ConsRest=GET(paste0(rutaHttr,"X_4_20152_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_4_20152_h2=Datos

ConsRest=GET(paste0(rutaHttr,"X_4_20161_h2"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_4_20161_h2=Datos

#Hx
ConsRest=GET(paste0(rutaHttr,"X_4_20162"), header = FALSE)
info <- content(ConsRest, "parsed")
Datos=as.data.frame(matrix(unlist(info), ncol = 2, byrow = TRUE))
Datos[,1]=as.numeric(levels(Datos[,1]))[Datos[,1]]
Datos[,2]=as.numeric(levels(Datos[,2]))[Datos[,2]]
X_4_20162=Datos
##

min_data = 0
max_data = 50
step_data = 1
##
ui <- fluidPage(

  headerPanel('Aplicacion tendencia materias', windowTitle = 'Aplicacion tendencia materias'),
  sidebarPanel(
    selectInput('opc', 'Seleccione la opcion', c("Tendencia", "Pronostico individual", "Pronostico total"),
                selected = "Tendencia"),
    selectInput('mat', 'Seleccione la materia', c("Materia 1", "Materia 2", "Materia 3", "Materia 4"),
                selected = "Materia 1"),
    numericInput('not1', 'Nota 1', 0,
                 min = 0, max = 50),
    numericInput('not2', 'Nota 2', 0,
                 min = 0, max = 50),
    actionButton(inputId = "go", 
                 label = "Calcular"),
    tags$p( tags$strong("Hx=Datos de prueba")," -> (V1=nota 1, V2=nota 2)"),
    verbatimTextOutput("stats3",placeholder = TRUE)
  
  ),
  
  mainPanel(
    plotOutput('plot1'),
    tags$p( tags$strong("H1=Aprobar")," -> (V1=nota 1, V2=nota 2)"),
    verbatimTextOutput("stats1", placeholder = TRUE),
    tags$p( tags$strong("H2=Reprobar")," -> (V1=nota 1, V2=nota 2)"),
    verbatimTextOutput("stats2",placeholder = TRUE)
    
  )
  
)
server <- function(input, output) {
  dataOpcion=eventReactive(input$go, {
    input$opc
  })
  dataNotas=eventReactive(input$go, {
    c(input$not1, input$not2)
  })
  dataMateria=eventReactive(input$go, {
    input$mat
  })
  X_h1R=eventReactive(input$go, {
    if(dataMateria()=="Materia 1"){
      X_h1 = rbind(X_1_20151_h1, X_1_20152_h1, X_1_20161_h1)
    }else{
      if(dataMateria()=="Materia 2"){
        X_h1 = rbind(X_2_20151_h1, X_2_20152_h1, X_2_20161_h1)
      }else{
        if(dataMateria()=="Materia 3"){
          X_h1 = rbind(X_3_20151_h1, X_3_20152_h1, X_3_20161_h1)
        }else{
          X_h1 = rbind(X_4_20151_h1, X_4_20152_h1, X_4_20161_h1)
        }
      }
    }
    
  })
  X_h2R=eventReactive(input$go, {
    if(dataMateria()=="Materia 1"){
      X_h2 = rbind(X_1_20151_h2, X_1_20152_h2, X_1_20161_h2)
    }else{
      if(dataMateria()=="Materia 2"){
        X_h2 = rbind(X_2_20151_h2, X_2_20152_h2, X_2_20161_h2)
      }else{
        if(dataMateria()=="Materia 3"){
          X_h2 = rbind(X_3_20151_h2, X_3_20152_h2, X_3_20161_h2)
        }else{
          X_h2 = rbind(X_4_20151_h2, X_4_20152_h2, X_4_20161_h2)
        }
      }
    }
 
  })
  X_xR=eventReactive(input$go, {
    if(dataMateria()=="Materia 1"){
      X_x=X_1_20162
    }else{
      if(dataMateria()=="Materia 2"){
          X_x=X_2_20162
      }else{
        if(dataMateria()=="Materia 3"){
          X_x=X_3_20162
        }else{
          X_x=X_4_20162
        }
      }
    }
  })
  
  output$plot1 <- renderPlot({
    if(dataMateria()=="Materia 1"){
     
      X_h1 = rbind(X_1_20151_h1, X_1_20152_h1, X_1_20161_h1)
      X_h2 = rbind(X_1_20151_h2, X_1_20152_h2, X_1_20161_h2)
      X_x=X_1_20162
      materia_i=1
    }else{
      if(dataMateria()=="Materia 2"){
       
        X_h1 = rbind(X_2_20151_h1, X_2_20152_h1, X_2_20161_h1)
        X_h2 = rbind(X_2_20151_h2, X_2_20152_h2, X_2_20161_h2)
        X_x=X_2_20162
        materia_i=2
      }else{
        if(dataMateria()=="Materia 3"){
    
          X_h1 = rbind(X_3_20151_h1, X_3_20152_h1, X_3_20161_h1)
          X_h2 = rbind(X_3_20151_h2, X_3_20152_h2, X_3_20161_h2)
          X_x=X_3_20162
          materia_i=3
        }else{
          
          X_h1 = rbind(X_4_20151_h1, X_4_20152_h1, X_4_20161_h1)
          X_h2 = rbind(X_4_20151_h2, X_4_20152_h2, X_4_20161_h2)
          X_x=X_4_20162
          materia_i=4
        }
      }
    }
   
    ##
    #Analisis Discriminante Lineal por materia
    #Esperanzas
    mu_X_h1 =c(mean(X_h1$V1), mean(X_h1$V2))
    mu_X_h1=as.data.frame(mu_X_h1)
    mu_X_h1=t(mu_X_h1)
    mu_X_h2 =c(mean(X_h2$V1), mean(X_h2$V2))
    mu_X_h2=as.data.frame(mu_X_h2)
    mu_X_h2=t(mu_X_h2)
    # Covarianzas
    Q_X_h1 =cov(X_h1)
    Q_X_h2 =cov(X_h2)
    # Covarianza promedio
    Q_X_T = (Q_X_h1+Q_X_h2)/2
    # Regla de decision
    w = (mu_X_h1-mu_X_h2)%*%solve(Q_X_T) #(1X2)(2X2)--1X2
    w=as.vector(w)
    c = (mu_X_h1%*%solve(Q_X_T)%*%t(mu_X_h1) - mu_X_h2%*%solve(Q_X_T)%*%t(mu_X_h2))/2 #--1X1
    c=as.vector(c)
    x1_LDA = c(min_data:max_data)
    x2_LDA = ((-w[1]/w[2])*x1_LDA)+(c/w[2])
    if(dataOpcion()=="Tendencia"){
      # Grafica de materia historico y regla de decision
      plot(X_h1$V1, X_h1$V2, xlab = "Nota 1", ylab = "Nota 2", pch=8, col="green", cex=0.7 , xlim=c(0 , 50), ylim=c(0 , 50) )
      lines(x1_LDA, x2_LDA ,col="red")
      points(X_h2$V1, X_h2$V2, pch=8, col="blue", cex=0.7)
      title(main=paste0('Tendencia Materia ',as.character(materia_i)))
      legend(43, 45,
             legend = c(paste0("H1->Aprobar")),
             #      lty = c("solid", "dotted"),
             cex=0.7,
             pch=8, col="green",
             xjust = 0, yjust = 0)
      legend(0, 0,
             legend = c(paste0("H2->Reprobar")),       
             #      lty = c("solid", "dotted"),
             cex=0.7,
             pch=8, col="blue",
             xjust = 0, yjust = 0)
      grid()
    }else{
      if(dataOpcion()=="Pronostico individual"){
        plot.new()
        plot.window(xlim=c(0,50), ylim=c(0,50))
        lines(x1_LDA, x2_LDA ,col="red")
        axis(1)
        axis(2)
        title(xlab="Nota 1")
        title(ylab="Nota 2")
        title(main=paste0('Pronostico Materia ',as.character(materia_i)))
        box()
        if((((-w[1]*dataNotas()[1]/w[2])+c/w[2])-dataNotas()[2])>=0){
          points(dataNotas()[1], dataNotas()[2], pch=9, col="blue", cex=2.5)
          legend(0, 0,
                 legend = c(paste0("H2->Reprobar")),       
                 #      lty = c("solid", "dotted"),
                 cex=0.7,
                 pch=9, col="blue",
                 xjust = 0, yjust = 0)
        }else{
          points(dataNotas()[1], dataNotas()[2], pch=9, col="green", cex=2.5)
          legend(43, 45,
                 legend = c(paste0("H1->Aprobar")),
                 #      lty = c("solid", "dotted"),
                 cex=0.7,
                 pch=9, col="green",
                 xjust = 0, yjust = 0)
        }
        grid()
      }else{
        # Evaluacion de datos actuales con regla de decision
        X_x_h1 = c()
        X_x_h2 = c()
        X_regla = ((-w[1]*t(X_x[,1])/w[2])+c/w[2])-t(X_x[,2])
        
        row_X_xR=nrow(X_regla)
        col_X_xR=ncol(X_regla)
        
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
        # Grafica pronostico total de materia
        plot(X_x_h1[,1], X_x_h1[,2], xlab = "Nota 2", ylab = "Nota 1", pch=8, col="green", cex=0.7 , xlim=c(0 , 50), ylim=c(0 , 50) )
        lines(x1_LDA, x2_LDA ,col="red")
        points(X_x_h2[,1], X_x_h2[,2], pch=8, col="blue", cex=0.7)
        title(main=paste0('Pronostico Materia ',as.character(materia_i)," (",as.character(row_X_x)," est.)"))
        legend(43, 45,
               legend = c(paste0("Aprueban: ",as.character(row_X_x_h1))),
               cex=0.7,
               pch=8, col="green",
               xjust = 0, yjust = 0)
        legend(0, 0,
               legend = c(paste0("Reprueban: ",as.character(row_X_x_h2))),       
               cex=0.7,
               pch=8, col="blue",
               xjust = 0, yjust = 0)
        grid()
      }
    }
  })
  output$stats1 <- renderPrint({
    summary(X_h1R())
  })
  output$stats2 <- renderPrint({
    summary(X_h2R())
  })
  output$stats3 <- renderPrint({
    summary(X_xR())
  })

}
shinyApp(ui = ui, server = server)
