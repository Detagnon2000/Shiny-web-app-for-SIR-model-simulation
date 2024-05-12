#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(deSolve)
library(ggplot2)
library(dplyr)
library(knitr)




#### function SIR
SIR<-function(t,init,parms){
  # Size of each compartment and of the population
  S = init[1]
  I = init[2]
  R = init[3]
  N = S+I+R
  # parameters
  beta = parms["beta"]
  gamma=parms["gamma"]
  ##variations
  dS=-beta*S*I/N
  dI=beta*S*I/N-gamma*I
  dR=gamma*I
  res = c(dS,dI,dR)
  list(res)
}

###### Simulation function

simulate_SIR=function(parameters){
  #parameters
  parms = c(parameters["beta"],parameters["gamma"])
  
  #initial conditions
  init <- c(parameters["N"]-parameters["I"]-parameters["R"],parameters["I"],parameters["R"])
  #simulation
  temps <- seq(0,15)
  solveSIR <- ode(y =init, times=temps, func = SIR,
                  parms = parms)
  solutionSIR=as.data.frame(solveSIR)
  names(solutionSIR)=c("time","S","I","R")
  
  return(solutionSIR)
}

# thetha_init=c("beta"=5,"gamma"=.5)
# data_i<-simulate_SIR(thetha_init)
# 
# ggplot(data_i)+
#   geom_line(aes(x=time,y=I))+
#   theme_minimal()

# Define server logic required to draw a histogram
function(input, output, session) {
  # Render the content of about.md with MathJax
  output$markdown <- renderUI({
    HTML(markdown::markdownToHTML(knit('about.Rmd', quiet = TRUE)))
  })
  
    output$distPlot <- renderPlot({
     
      thetha_init=c("beta"=input$beta,"gamma"=input$gamma,"N"=input$No,"I"=input$Io,"R"=input$Ro)
      data_i<-simulate_SIR(thetha_init)
      ggplot(data_i)+
        geom_line(aes(x=time,y=I),col='red')+
        ylab("Number of infected people")+
        ggtitle("Number of Infected people over time")+
        theme_minimal()
    })

}
