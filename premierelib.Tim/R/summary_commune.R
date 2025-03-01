#'@name summary_commune
#'
#'@title Résumé des caractéristiques des élus municipaux d'une commune
#'
#'@description
#'Cette fonction fournit un résumé des caractéristiques des élus municipaux d'une commune donnée.
#'Elle affiche le nom de la commune, le nombre total d'élus, la distribution des âges des élus,
#'ainsi que les informations de l'élu(e) le plus âgé(e).
#'
#'@param x Un objet de classe `commune` contenant les informations des élus municipaux.
#'Il doit inclure les colonnes `Libellé.de.la.commune`, `Nom.de.l.élu`, `Prénom.de.l.élu` et `Âge`.
#'@return Un affichage des informations clés sur les élus municipaux de la commune
#'@export

summary_commune <- function(x) {

  if (!inherits(x, "commune")) {
    stop("L'objet doit être de type 'commune'.")
  }

  elu_plus_age <- trouver_l_elu_le_plus_age(x)

  cat("Nom de la commune :", unique(x$Libellé.de.la.commune), "\n")
  cat("Nombre d'élu.e.s :",  compter_nombre_d_elus(x), "\n")

  cat("Distribution des âges des élu.e.s :", "\n")
  print(calcul_distribution_age(x))

  cat("L'élu.e le ou la plus âgé.e :", "\n")
  cat("Nom :", elu_plus_age$Nom.de.l.élu, "\n")
  cat("Prénom :", elu_plus_age$Prénom.de.l.élu, "\n")
  cat("Âge :", elu_plus_age$Date.de.naissance, "\n")

}
