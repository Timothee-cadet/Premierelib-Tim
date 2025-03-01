#Test unitaire 1 : Vérifier que la fonction échoue si les colonnes nécessaires sont manquantes

test_that("creer_departement échoue si les colonnes nécessaires sont manquantes", {
  # Créer un dataframe sans les colonnes nécessaires
  df_invalid <- data.frame(
    Code.du.département = c("01", "02"),
    Libellé.du.département = c("Département 1", "Département 2"),
    Code.de.la.commune = c("A", "B")
  )

  # Vérifier que la fonction lève une erreur si les colonnes nécessaires sont manquantes
  expect_error(creer_departement(df_invalid),
               "Le data.frame doit contenir les colonnes nécessaires pour le département.")
})


#Test unitaire 2 : Vérifier que la fonction crée un objet de type departement avec les colonnes nécessaires

test_that("creer_departement crée un objet de type 'departement' avec les colonnes nécessaires", {
  # Créer un dataframe valide avec toutes les colonnes nécessaires pour le département
  df_valid <- data.frame(
    Code.du.département = c("01", "01"),
    Libellé.du.département = c("Département 1", "Département 1"),
    Code.de.la.commune = c("A", "B"),
    Libellé.de.la.commune = c("Commune 1", "Commune 2"),
    Code.de.la.collectivité.à.statut.particulier = c("CSP1", NA),
    Libellé.de.la.collectivité.à.statut.particulier = c("Collectivité 1", NA),
    Nom.de.l.élu = c("Élu 1", "Élu 2"),
    Prénom.de.l.élu = c("Prénom 1", "Prénom 2"),
    Code.sexe = c("M", "F"),
    Date.de.naissance = c("1990-01-01", "1985-05-15"),
    Libellé.de.la.fonction = c("Maire", "Adjoint"),
    Date.de.début.de.la.fonction = c("2015-01-01", "2016-01-01"),
    Code.nationalité = c("FR", "FR")
  )

  # Créer l'objet département
  departement_obj <- creer_departement(df_valid)

  # Vérifier que l'objet est de type 'departement'
  expect_s3_class(departement_obj, "departement")

  # Vérifier que l'objet contient les informations correctes
  expect_equal(departement_obj$Code.du.département, "01")
  expect_equal(departement_obj$Libellé.du.département, "Département 1")
  expect_equal(length(departement_obj$Communes), 2)  # Nombre de communes dans le département
})
