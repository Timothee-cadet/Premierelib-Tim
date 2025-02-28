#'@title Création d'un objet spécifique pour les communes
#'
#'@name creer_commune
#'@description
#'Cette fonction permet de créer un objet de type commune à partir d'un dataframe contenant des informations sur les élus municipaux. Elle extrait les informations essentielles pour une commune donnée y compris les élus, leurs fonctions, et des informations de base les concernant.
#'
#'@param df Un dataframe contenant les informations des élus municipaux, avec au minimum les colonnes suivantes :
#'\itemize{
#'   \item `Code.de.la.commune` : Code de la commune.
#'   \item `Libellé.de.la.commune` : Nom de la commune.
#'   \item `Nom.de.l.élu` : Nom de l'élu.
#'   \item `Prénom.de.l.élu` : Prénom de l'élu.
#'   \item `Code.sexe` : Code du sexe de l'élu.
#'   \item `Date.de.naissance` : Date de naissance de l'élu.
#'   \item `Libellé.de.la.fonction` : Fonction de l'élu.
#'   \item `Date.de.début.de.la.fonction` : Date de début de la fonction de l'élu.
#'   \item `Code.nationalité` : Code de nationalité de l'élu.
#' }
#'
#'@return Un objet de type `commune` qui est une liste contenant des informations résumées pour une commune, telles que :
#'\itemize{
#'   \item `Code.de.la.commune` : Code unique de la commune.
#'   \item `Libellé.de.la.commune` : Nom de la commune.
#'   \item `Nom.de.l.élu` : Liste des élus dans la commune.
#'   \item `Prénom.de.l.élu` : Liste des prénoms des élus.
#'   \item `Code.sexe` : Liste des codes sexe des élus.
#'   \item `Date.de.naissance` : Liste des dates de naissance des élus.
#'   \item `Libellé.de.la.fonction` : Liste des fonctions des élus.
#'   \item `Date.de.début.de.la.fonction` : Liste des dates de début de fonction des élus.
#'   \item `Code.nationalité` : Liste des codes de nationalité des élus.
#' }
#'
#'@export
creer_commune <- function(df) {

  # Colonnes requises
  required_columns <- c(
    "Code.de.la.commune",
    "Libellé.de.la.commune",
    "Nom.de.l.élu",
    "Prénom.de.l.élu",
    "Code.sexe",
    "Date.de.naissance",
    "Libellé.de.la.fonction",
    "Date.de.début.de.la.fonction",
    "Code.nationalité"
  )

  # Vérification des colonnes
  if (!all(required_columns %in% colnames(df))) {
    stop("Le data.frame doit contenir les colonnes nécessaires pour la commune.")
  }

  # Nettoyage des doublons exacts
  df <- df[!duplicated(df), ]

  # Création de la liste pour la commune
  commune <- list(
    Code.de.la.commune = unique(df$Code.de.la.commune),
    Libellé.de.la.commune = unique(df$Libellé.de.la.commune),
    Nom.de.l.élu = unique(df$Nom.de.l.élu),
    Prénom.de.l.élu = unique(df$Prénom.de.l.élu),
    Code.sexe = unique(df$Code.sexe),
    Date.de.naissance = unique(df$Date.de.naissance),
    Libellé.de.la.fonction = unique(df$Libellé.de.la.fonction),
    Date.de.début.de.la.fonction = unique(df$Date.de.début.de.la.fonction),
    Code.nationalité = unique(df$Code.nationalité))

  # Attribution de la classe 'commune'
  class(commune) <- "commune"

  return(commune)
}


