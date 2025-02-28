#'@title Calcul de la distribution des âges des élus municipaux
#'
#'@description
#'Cette fonction calcule les quantiles de la distribution des âges des élus municipaux dans un DataFrame.
#'
#'@param df Un DataFrame contenant les informations des élus municipaux. Il doit inclure une colonne Date.de.naissance au format jj/mm/aaaa.
#'@return Un vecteur numérique contenant les quantiles de l'âge : minimum, premier quartile (Q1), médiane (Q2), troisième quartile (Q3) et maximum.
#'
#'@details
#'- La fonction convertit la colonne `Date.de.naissance` en format Date.
#'- Elle calcule l'âge en années à partir de la date de naissance.
#'- Elle retourne les quantiles 0% (min), 25% (Q1), 50% (médiane), 75% (Q3) et 100% (max).
#'- Les valeurs manquantes (`NA`) sont ignorées dans le calcul.

calcul_distribution_age <- function(df) {
  # Vérification que la colonne 'Date.de.naissance' existe dans le DataFrame
  if (!"Date.de.naissance" %in% colnames(df)) {
    stop("La colonne 'Date.de.naissance' est requise dans le DataFrame")
  }

  # Conversion de la colonne 'Date.de.naissance' en format Date
  df$Date.de.naissance <- as.Date(df$Date.de.naissance, format = "%d/%m/%Y")

  # Vérifier les dates valides (éviter les NA)
  df$Valid.Date <- !is.na(df$Date.de.naissance)

  # Calcul de l'âge en années
  df$Age <- as.integer(difftime(Sys.Date(), df$Date.de.naissance, units = "days") / 365.25)

  # Calcul des quantiles de l'âge
  quantiles <- quantile(df$Age, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

  return(quantiles)
}
