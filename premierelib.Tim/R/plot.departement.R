#'@title Visualisation de la répartition des élus par catégorie socio-professionnelle pour un département
#'
#'@method plot departement
#'@description
#' Cette fonction génère un graphique en barres représentant la répartition des élus municipaux en fonction de leur catégorie socio-professionnelle pour un département donné.
#'
#'@param df Un dataframe contenant les informations des élus municipaux d'un seul département.
#'Il doit inclure au minimum les colonnes suivantes :
#'\itemize{
#'   \item `Libellé.du.département` : Nom du département.
#'   \item `Libellé.de.la.commune` : Nom de la commune.
#'   \item `Code.de.la.catégorie.socio.professionnelle` : Code représentant la catégorie socio-professionnelle des élus.
#' }
#'
#'@return Un graphique en barres affichant le nombre d'élus par code professionnel pour le département sélectionné.
#'@export
plot_departement <- function(df) {

  # Vérification de la structure du DataFrame
  departement_name <- unique(df$Libellé.du.département)
  nombre_communes <- length(unique(df$Libellé.de.la.commune))

  if (length(departement_name) > 1) {
    stop("Le data.frame contient plusieurs départements. Veuillez filtrer pour un seul département.")
  }

  # Comptage des occurrences des codes socio-professionnels
  professions_code <- table(df$Code.de.la.catégorie.socio.professionnelle)

  # Trier les codes professionnels par fréquence et garder les 10 plus fréquents
  professions_code <- sort(professions_code, decreasing = TRUE)[1:10]

  # Création du graphique avec barplot()
  barplot(
    professions_code,
    horiz = TRUE,
    las = 1,
    col = "steelblue",
    main = paste(departement_name, "-", nombre_communes, "communes"),
    xlab = paste("Libellés des 10 codes professionnels les plus représentés pour le département", departement_name),
    ylab = "Code Professionnel",
    cex.names = 0.7  # Réduction de la taille du texte sur l'axe Y pour lisibilité
  )
}

