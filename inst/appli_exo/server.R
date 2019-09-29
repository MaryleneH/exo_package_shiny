library(shiny)
library(gapminder)
library(dplyr)
library(ggplot2)
library(flextable)

shinyServer(function(input, output){
# affichage du titre au dessus du graphique en fonction
# de la sélection

  output$Titre <- renderUI({

    if (input$graphique == "Diagrammes paire à paire"){

      h4("Diagrammes paire à paire : version simple")

    }else{

      h4("Focus sur un graphique particulier : lien entre espérance de vie, PIB, continent")

    }

  })
  gapmind2 <- gapminder[,c("year","lifeExp","pop","gdpPercap")]

  output$graph <- renderPlot({
    if (input$graphique == "Diagrammes paire à paire"){
        plot(gapmind2)
    }else{
      ggplot(data = gapminder,
             aes(x = gdpPercap, y = lifeExp, color = continent))+
        geom_point()+
        scale_x_log10()+
        theme_minimal()
    }

  })

  stat_simpl <- gapminder %>%
    filter(year == 1997) %>%
    group_by(continent) %>%
    summarise(moyenne_esp = mean(lifeExp),
              moyenne_gdp = mean(gdpPercap))

  output$tableau <- renderUI({
    ft <- flextable(head(stat_simpl))
    flextable::autofit(ft)%>%
      htmltools_value()
  })

  output$full_data <- DT::renderDataTable({

    gapminder::gapminder    })

}
  )
