#' exo_shiny
#'
#' @import shiny
#'
#' @return launch the app
#' @export
#'
exo_shiny <- function(){
  appDir <- system.file("appli_exo", package = "ExoMary")  ;
  runApp(appDir, display.mode = "normal")
}
