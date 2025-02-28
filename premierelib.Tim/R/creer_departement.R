#'@title Création d'un objet spécifique pour les départements
#'
#'@name creer_departement
#'@description
#'Cette fonction permet de créer un objet de type departement à partir d'un dataframe contenant des informations sur les communes, les élus et les collectivités. Elle extrait des informations essentielles concernant un département y compris les communes qui le composent, les élus et leurs âges, ainsi que des informations supplémentaires sur les collectivités à statut particulier.
#'
#'@param df Un dataframe contenant les informations suivantes :
#'\itemize{
#'   \item `Code.du.département` : Code du département.
#'   \item `Libellé.du.département` : Nom du département.
#'   \item `Code.de.la.commune` : Code de la commune.
#'   \item `Libellé.de.la.commune` : Nom de la commune.
#'   \item `Code.de.la.collectivité.à.statut.particulier` (optionnel) : Code de la collectivité à statut particulier.
#'   \item `Libellé.de.la.collectivité.à.statut.particulier` (optionnel) : Nom de la collectivité à statut particulier.
#' }
#'
#'@return Un objet de type `departement`, qui est une liste contenant les informations suivantes :
#'\itemize{
#'   \item `Code.du.département` : Code unique du département.
#'   \item `Libellé.du.département` : Nom du département.
#'   \item `Collectivite` : Liste des collectivités à statut particulier si elles existent dans les données (sinon `NULL`).
#'   \item `Communes` : Liste des objets de type `commune` créés pour chaque commune présente dans le département.
#' }
#'@export
creer_departement <- function(df) {
  # Colonnes obligatoires
  required_columns <- c(
    "Code.du.département",
    "Libellé.du.département",
    "Code.de.la.commune",
    "Libellé.de.la.commune"
  )

  # Vérification des colonnes
  if (!all(required_columns %in% colnames(df))) {
    stop("Le data.frame doit contenir les colonnes nécessaires pour le département.")
  }

  has_collectivite <- all(c("Code.de.la.collectivité.à.statut.particulier",
                            "Libellé.de.la.collectivité.à.statut.particulier") %in% colnames(df))

  # Création de la liste pour le département
  departement <- list(
    Code.du.département = unique(df$Code.du.département),
    Libellé.du.département = unique(df$Libellé.du.département),

    # Intégration des collectivités si présentes
    Collectivite = if (has_collectivite) {
      unique(df[, c("Code.de.la.collectivité.à.statut.particulier",
                    "Libellé.de.la.collectivité.à.statut.particulier")])
    } else {
      NULL
    },

    # Liste des communes associées au département
    Communes = lapply(split(df, df$Code.de.la.commune), creer_commune)
  )

  # Attribution de la classe 'departement'
  class(departement) <- "département"

  return(departement)
}

creer_departement(df_Loire_Atlantique)
