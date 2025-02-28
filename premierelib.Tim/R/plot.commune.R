#'@title Visualisation de la répartition des élus par catégorie socio-professionnelle pour une commune
#'
#'@method plot commune
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
#'@export
plot_commune <- function(df) {

  # Vérification de la structure du DataFrame
  nom_commune <- unique(df$Libellé.de.la.commune)
  nom_department <- unique(df$Libellé.du.département)

  if (length(nom_commune) > 1) {
    stop("Le data.frame contient plusieurs communes. Veuillez filtrer pour une seule commune.")
  }

  # Comptage des occurrences des codes socio-professionnels
  professions_code <- table(df$Code.de.la.catégorie.socio.professionnelle)

  # Trier les codes professionnels par fréquence
  professions_code <- sort(professions_code, decreasing = TRUE)

  # Création du graphique avec barplot()
  barplot(
    professions_code,
    horiz = TRUE,
    las = 1,
    col = "steelblue",
    main = paste(nom_commune, "-", nom_department),
    xlab = paste("Libellés des codes professionnels pour les élus (", length(df$Nom.de.l.élu), " élus)", sep = ""),
    ylab = "Code Professionnel",
    cex.names = 0.7  # Réduction de la taille du texte sur l'axe Y pour lisibilité
  )
}
