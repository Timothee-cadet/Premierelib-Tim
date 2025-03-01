#'@name plot.commune
#'
#'@title Visualisation de la répartition des élus par catégorie socio-professionnelle pour une commune
#'
#'@description
#'Cette fonction génère un graphique en barres représentant la répartition des élus municipaux en fonction de leur catégorie socio-professionnelle pour une commune donnée.
#'
#'@param df Un dataframe contenant les informations des élus municipaux d'une seule commune.
#'Il doit inclure au minimum les colonnes suivantes :
#'\itemize{
#'   \item `Libellé.de.la.commune` : Nom de la commune.
#'   \item `Libellé.du.département` : Nom du département.
#'   \item `Code.de.la.catégorie.socio.professionnelle` : Code représentant la catégorie socio-professionnelle des élus.
#'   \item `Nom.de.l.élu` : Nom des élus.
#' }
#'
#'@return Un graphique en barres affichant le nombre d'élus par code professionnel pour la commune sélectionnée.
#'@importFrom ggplot2 ggplot aes geom_bar labs theme_minimal theme
#'@import dplyr
#'@export

plot_commune <- function(df) {

  commune_name <- unique(df$Libellé.de.la.commune)
  departement_name <- unique(df$Libellé.du.département)

  if (length(commune_name) > 1) {
    stop("Le data.frame contient plusieurs communes. Veuillez filtrer pour une seule commune.")
  }

  professions_code <- df |>
    group_by(Code.de.la.catégorie.socio.professionnelle) |>
    summarise(n = n(), .groups = "drop") |>
    arrange(desc(n))

  ggplot(professions_code,
         aes(x = n,
             y = reorder(Code.de.la.catégorie.socio.professionnelle, n))) +
    geom_bar(stat = "identity", fill = "steelblue") +
    labs(
      title = paste(commune_name, "-", departement_name),
      x = paste("Libellés des codes professionnels pour les élus (", compter_nombre_d_elus(df), " élus)", sep = ""),
      y = "Code Professionnel"
    ) +
    theme_minimal() +
    theme(axis.text.y = element_text(size = 5))
}
