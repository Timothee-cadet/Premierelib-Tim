#'@title Compter le nombre d'adjoints
#'
#'@name compter_nombre_d_adjoints
#'@description
#'Cette fonction permet de compter le nombre d'adjoints présents dans un DataFrame contenant les élus conseillers municipaux.
#'@param df Un DataFrame contenant les informations des élus municipaux. Il doit inclure une colonne Libellé.de.la.fonction.
#'@return Un entier représentant le nombre total d'adjoints trouvés dans le DataFrame.
#'@details
#'La fonction recherche les lignes où Libellé.de.la.fonction contient le mot "adjoint".
#Fonction pour compter le nombre d'adjoint sans l'aide de librairie
compter_nombre_d_adjoints <- function(df) {
  # Vérifier que la colonne 'Libellé.de.la.fonction' existe dans le DataFrame
  if (!"Libellé.de.la.fonction" %in% colnames(df)) {
    stop("La colonne 'Libellé.de.la.fonction' est requise dans le DataFrame")
  }

  # Compter le nombre d'adjoints
  sum(grepl("adjoint", df$Libellé.de.la.fonction, ignore.case = TRUE))
}

