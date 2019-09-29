library(shiny)
library(gapminder)
library(dplyr)
library(ggplot2)
library(flextable)

shinyUI(

  fluidPage(
    br(),

    br(),

    titlePanel(title = " ",windowTitle = "Exercice shiny"),

    sidebarLayout(
      sidebarPanel(
        br(),
        br(),
        selectInput(inputId = "graphique",

                    label = "Sélectionner le graphique",

                    choices = c("Diagrammes paire à paire", "Focus lien Life Exp / GDP"),

                    selected = "Fonction publique territoriale"),

        br()

      ),

      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Les graphiques",
                             br(),

                             tags$style(type='text/css', '#Titre {background-color: white; color: #A76726;}'),

                             htmlOutput("Titre"),

                             br(),
                             plotOutput("graph")),
                    tabPanel("Le tableau", br(),br(),uiOutput("tableau")),
                    tabPanel("les données",br(),br(),DT::dataTableOutput("full_data"))

        )


      )
    )

  )
)
