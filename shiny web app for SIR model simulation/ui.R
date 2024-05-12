#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(deSolve)
library(ggplot2)
library(dplyr)
library(shinythemes)
library(mathjaxr)

# Define UI for application that draws a histogram
fluidPage(theme = shinytheme("superhero"),
  navbarPage(
    # Application title
    "Simulation of an SIR model",
    tabPanel('Main',
    # Sidebar with a slider input for number of bins
        sidebarLayout(
            sidebarPanel(
                numericInput("No","Enter the total population:",value = 1000),
            
                numericInput("Io","Enter the initial infected people:",value = 10),
            
                numericInput("Ro","Enter the initial recovered people:",value = 100),
            
                sliderInput("beta",
                            "Enter the force of infection:",
                            min = 0.1,
                            max = 5,
                            value = 1.7),
                sliderInput("gamma",
                            "Enter the recovery rate:",
                            min = 0.1,
                           max = 5,
                           value = 0.5),
            
            ),

            # Show a plot of the generated distribution
            mainPanel(
                plotOutput("distPlot")
            )
        )
    ),
    tabPanel('About',withMathJax(includeMarkdown("about.Rmd")))



    )

    )




