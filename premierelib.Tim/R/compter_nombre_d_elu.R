#'@title Compter le nombre d'élu
#'
#'@name compter_nombre_d_elu
#'@description
#'Cette fonction permet de compter le nombre d'élu pour le Dataframe: élus conseillés municipaux
#'@param df Un data.frame contenant au minimum les colonnes Nom.de.l.élu, Prénom.de.l.élu et Date.de.naissance
#'@return Un entier représentant le nombre d'élu
#'@import dplyr

compter_nombre_d_elus <- function(df) {
  df |>
    select(Nom.de.l.élu, Prénom.de.l.élu, Date.de.naissance) |>
    distinct(Nom.de.l.élu, Prénom.de.l.élu, Date.de.naissance) |>
    nrow()
}

