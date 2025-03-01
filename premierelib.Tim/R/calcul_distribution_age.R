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
#' @export
#' @import dplyr
#' @importFrom lubridate today dmy
#' @importFrom stats quantile

calcul_distribution_age <- function(df) {
  # Convertir la colonne 'Date.de.naissance' en date et calculer l'âge
  df <- df |>
    mutate(age = as.numeric(difftime(today(), dmy(Date.de.naissance), units = "days")) / 365)

  # Exclure les NA de la colonne 'age' pour calculer les quantiles
  df_clean <- df |> filter(!is.na(age))  # Filtrer les lignes avec NA dans 'age'

  # Calculer les quantiles
  quantiles <- quantile(df_clean$age, probs = c(0, 0.25, 0.50, 0.75, 1), na.rm = TRUE)

  return(quantiles)
}

