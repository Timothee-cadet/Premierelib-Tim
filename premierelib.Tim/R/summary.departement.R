#' @title Résumé des caractéristiques d'un département
#'
#' @description
#' Cette fonction fournit un résumé des informations concernant les élus municipaux d'un département.
#' Elle affiche plusieurs statistiques clés, notamment :
#' - Le nom du département.
#' - Le nombre total de communes et d'élus.
#' - La distribution des âges des élus.
#' - L'élu.e le/la plus âgé.e et le/la plus jeune, ainsi que leur commune.
#' - La commune avec la moyenne d'âge la plus faible et celle avec la moyenne la plus élevée.
#'
#' @param x Un objet de classe département, contenant les informations des élus municipaux du département.
#' @return Un résumé textuel affiché dans la console avec les statistiques sur les élus du département.
#'
#' @details
#' - La fonction vérifie d'abord que x est bien un objet de classe "département".
#' - Elle calcule les statistiques en utilisant les dates de naissance pour déterminer l'âge des élus.
#' - Les résultats sont affichés directement dans la console avec print().
#'@export
#Sans librairie
summary_departement <- function(x) {

  if (!inherits(x, "département")) {
    stop("L'objet doit être de type 'département'.")
  }

  cat("Nom du département :", unique(x$Libellé.du.département), "\n")
  cat("Nombre de communes :", length(unique(x$Libellé.de.la.commune)), "\n")
  cat("Nombre d'élu.e.s :", length(unique(x$Nom.de.l.élu)), "\n")

  # Conversion des dates
  x$Date.de.naissance <- as.Date(x$Date.de.naissance, format = "%d/%m/%Y")

  # Calcul de l'âge des élus
  x$Âge <- as.integer(difftime(Sys.Date(), x$Date.de.naissance, units = "days") / 365.25)

  # Distribution des âges
  cat("Distribution des âges des élu.e.s :", "\n")
  print(summary(x$Âge))

  # Trouver l'élu.e le/la plus âgé.e
  elu_max <- x[which.min(x$Date.de.naissance), ]
  cat("Élu.e le/la plus âgé.e :", elu_max$Nom.de.l.élu, ", Âge :", elu_max$Âge,
      ", Commune :", elu_max$Libellé.de.la.commune, "\n")

  # Trouver l'élu.e le/la plus jeune
  elu_min <- x[which.max(x$Date.de.naissance), ]
  cat("Élu.e le/la plus jeune :", elu_min$Nom.de.l.élu, ", Âge :", elu_min$Âge,
      ", Commune :", elu_min$Libellé.de.la.commune, "\n")

  # Commune avec la moyenne d’âge la plus faible
  age_par_commune <- aggregate(Âge ~ Libellé.de.la.commune, data = x, FUN = mean)

  commune_min_age <- age_par_commune$Libellé.de.la.commune[which.min(age_par_commune$Âge)]
  cat("Commune avec la moyenne d’âge la plus faible :", commune_min_age, "\n")
  print(summary(x$Âge[x$Libellé.de.la.commune == commune_min_age]))

  # Commune avec la moyenne d’âge la plus élevée
  commune_max_age <- age_par_commune$Libellé.de.la.commune[which.max(age_par_commune$Âge)]
  cat("Commune avec la moyenne d’âge la plus élevée :", commune_max_age, "\n")
  print(summary(x$Âge[x$Libellé.de.la.commune == commune_max_age]))

}
