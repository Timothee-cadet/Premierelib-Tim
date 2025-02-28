#' @title Cette fonction compte pour chaque code professionnel, le nombre d’élus ayant ce code
#'
#' @name plot_code_professions
#' @description
#' Cette fonction calcule, pour chaque code professionnel dans un jeu de données, le nombre d'élus ayant ce code, puis génère un graphique à barres horizontal pour afficher la répartition des élus par code professionnel.
#'
#' @param df Un dataframe contenant les données des élus, avec une colonne nommée `Code.de.la.catégorie.socio.professionnelle` qui représente les codes professionnels des élus.
#'
#' @return Cette fonction génère un graphique à barres horizontal affichant le nombre d'élus par code professionnel. Le graphique est tracé directement dans la sortie graphique de R sans nécessiter de librairies externes.
#'
plot_code_professions <- function(df) {
  # Vérification si la colonne nécessaire existe
  if (!"Code.de.la.catégorie.socio.professionnelle" %in% colnames(df)) {
    stop("Le data.frame doit contenir la colonne 'Code.de.la.catégorie.socio.professionnelle'.")
  }

  # Comptage du nombre d'élus par code professionnel
  counts <- table(df$Code.de.la.catégorie.socio.professionnelle)

  # Tracé du bar chart horizontal sans librairie en utilisant barplot
  barplot(counts, horiz = TRUE, las = 1, col = "lightblue",
          main = "Nombre d'élus par code professionnel",
          xlab = "Nombre d'élus", ylab = "Code Professionnel")
}
