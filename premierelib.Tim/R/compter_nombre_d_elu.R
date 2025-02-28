#'@title Compter le nombre d'élu
#'
#'@name compter_nombre_d_elu
#'@description
#'Cette fonction permet de compter le nombre d'élu pour le Dataframe: élus conseillés municipaux
#'@param df Un data.frame contenant au minimum les colonnes Nom.de.l.élu, Prénom.de.l.élu et Date.de.naissance
#'@return Un entier représentant le nombre d'élu
compter_nombre_d_elu <- function(df) {

  # Sélection des colonnes nécessaires sans librairie
  df_unique <- unique(df[, c("Nom.de.l.élu", "Prénom.de.l.élu", "Date.de.naissance")])

  return(nrow(df_unique))
}

