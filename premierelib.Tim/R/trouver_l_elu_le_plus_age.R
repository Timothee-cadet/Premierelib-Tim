#'@name trouver_l_elu_le_plus_age
#'
#'@title Trouver l'élu municipal le plus âgé
#'
#'@description
#'Cette fonction identifie l'élu le plus âgé dans un DataFrame contenant des élus municipaux.
#'
#'@param df Un DataFrame contenant les informations des élus municipaux. Il doit inclure une colonne Date.de.naissance au format jj/mm/aaaa.
#'@return Un DataFrame avec le nom, le prénom, la date de naissance et l'âge de l'élu le plus âgé.
#'@importFrom dplyr select mutate slice
#'@importFrom lubridate dmy interval as.period
#'@import purrr

trouver_l_elu_le_plus_age <- function(df){

  # Convertir Date.de.naissance en texte, gérer les valeurs manquantes, puis convertir en date
  df <- df |>
    dplyr::mutate(df, Date.de.naissance = as.character(Date.de.naissance))
  # S'assurer que c'est du texte

  # Remplacer les valeurs manquantes ou invalides (NA, "", "Inconnu", "-") par NA
  df <- df |>
    dplyr::mutate(Date.de.naissance = ifelse(Date.de.naissance %in% c("", "NA", "Inconnu", "-"), NA, Date.de.naissance))

  # Convertir les dates au format "jour-mois-année"
  df <- df |>
    dplyr::mutate(Date.de.naissance = dmy(Date.de.naissance))

  # Supprimer les lignes avec des dates invalides (NA)
  df <- df |>
    dplyr::filter(!is.na(Date.de.naissance))

  # Trouver l'élu le plus âgé (l'élément avec la date de naissance la plus ancienne)
  df <- df |>
    dplyr::slice(which.min(Date.de.naissance))

  # Calculer l'âge de l'élu
  df <- df |>
    dplyr::mutate(Âge = as.integer(as.period(interval(Date.de.naissance, Sys.Date()))$year))

  # Sélectionner uniquement les colonnes pertinentes
  df <- df |>
    dplyr::select(Nom.de.l.élu, Prénom.de.l.élu, Date.de.naissance, Âge)

  # Afficher le résultat
  print(df)

}

