#'@name generer_rapport_pdf
#'
#'@title Générer un rapport pour une commune et un département en PDF
#'
#'@description Cette fonction génère un rapport PDF à partir d'un fichier Quarto. Elle utilise les codes de la commune et du département spécifiés, puis enregistre le rapport dans le dossier de sortie.
#'
#'@param commune Un code de commune sous forme de chaîne de caractères (ex : "44109").
#'@param departement Un code de département sous forme de chaîne de caractères (ex : "44").
#'@param output Chemin de sortie du fichier PDF généré, sous forme de chaîne de caractères.
#'
#'@return un fichier PDF
#'
#'@import dplyr
#'@import quarto
#'@import ggplot2
#'@examples
#'\dontrun{
#' generer_rapport_pdf(
#'  commune = "44330",
#'  departement = "44",
#'  output = "rapport_la_chapelle.pdf"
#')
#'}
#'
#' @export

generer_rapport_pdf <- function(commune, departement, output) {
  quarto::quarto_render(
    input = file.path("C:", "Users", "Timothée", "Documents", "M1 ECAP",
                      "R avancé", "Premierelib-Tim", "premierelib.Tim",
                      "inst", "rapport.qmd"),

    output_file = output,
    output_format = "pdf",  # Définit le format de sortie en PDF
    pdf_engine = "wkhtmltopdf",
    execute_params = list(
      code_commune = commune,
      code_departement = departement
    )
  )
}
