#'@title Cette fonction compte pour chaque code professionnel, le nombre d’élus ayant ce code
#'
#'@name plot_code_professions
#'@description
#'Cette fonction calcule, pour chaque code professionnel dans un jeu de données, le nombre d'élus ayant ce code, puis génère un graphique à barres horizontal pour afficher la répartition des élus par code professionnel.
#'
#'@param df Un dataframe contenant les données des élus, avec une colonne nommée `Code.de.la.catégorie.socio.professionnelle` qui représente les codes professionnels des élus.
#'
#'@return Cette fonction génère un graphique à barres horizontal affichant le nombre d'élus par code professionnel. Le graphique est tracé directement dans la sortie graphique de R sans nécessiter de librairies externes.
#'@import ggplot2

plot_code_professions <- function(df) {


  # Compter les occurrences de chaque code socio professionnels
  professions_code <- df |>
    group_by(Code.de.la.catégorie.socio.professionnelle) |>
    summarise(n = n()) |>
    # On compte le nombre d'élus par catégories
    arrange(desc(n))
  # On arrange par ordre décroissant

  ggplot(professions_code,
         aes(x = n,
             y = reorder(Code.de.la.catégorie.socio.professionnelle, n))) +
    geom_bar(stat = "identity", fill = "steelblue") +
    # stat identidy affiche directement les valeurs
    labs(title = paste("Nombre d'élus par catégorie socio professionnelle"),
         x = "Nombre d'élus", y = "Code Professionnel") +
    theme_minimal() +
    theme(axis.text.y = element_text(size = 5))
}

