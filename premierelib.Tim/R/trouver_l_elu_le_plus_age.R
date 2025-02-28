#'@title Trouver l'élu municipal le plus âgé
#'
#'@description
#'Cette fonction identifie l'élu le plus âgé dans un DataFrame contenant des élus municipaux.
#'
#'@param df Un DataFrame contenant les informations des élus municipaux. Il doit inclure une colonne Date.de.naissance au format jj/mm/aaaa.
#'@return Un DataFrame avec le nom, le prénom, la date de naissance et l'âge de l'élu le plus âgé.
#'@details
#'La fonction convertit la colonne Date.de.naissance en format Date, identifie la plus ancienne date de naissance et calcule l'âge en années.
#'@seealso [validate_schema()]
#'@export
trouver_l_elu_le_plus_age <- function(df) {
  # Vérification si la colonne Date.de.naissance existe
  if (!"Date.de.naissance" %in% colnames(df)) {
    stop("Le data.frame doit contenir la colonne 'Date.de.naissance'.")
  }

  # Convertir la colonne Date.de.naissance en format Date
  df$Date.de.naissance <- as.Date(df$Date.de.naissance, format = "%d/%m/%Y")

  # Trouver la plus ancienne date de naissance
  index_plus_age <- which.min(df$Date.de.naissance)

  elu_plus_age <- df[index_plus_age, c("Nom.de.l.élu", "Prénom.de.l.élu", "Date.de.naissance")]

  # Calculer l'âge en années
  elu_plus_age$Âge <- as.integer(difftime(Sys.Date(), elu_plus_age$Date.de.naissance, units = "days") / 365.25)

  return(elu_plus_age)
}
