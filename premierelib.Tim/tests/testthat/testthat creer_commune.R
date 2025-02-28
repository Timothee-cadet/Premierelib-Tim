#Test unitaire 1 : Vérifier que la fonction échoue si les colonnes nécessaires sont manquantes

test_that("creer_commune échoue si les colonnes nécessaires sont manquantes", {
  # Créer un dataframe sans les colonnes nécessaires
  df_invalid <- data.frame(
    Code.de.la.commune = c("A", "B", "C"),
    Libellé.de.la.commune = c("Commune1", "Commune2", "Commune3")
  )

  # Vérifier que la fonction lève une erreur si les colonnes nécessaires sont manquantes
  expect_error(creer_commune(df_invalid),
               "Le data.frame doit contenir les colonnes nécessaires pour la commune.")
})


#Test unitaire 2 : Vérifier que la fonction crée un objet de type commune avec les colonnes nécessaires

test_that("creer_commune crée un objet de type 'commune' avec les colonnes nécessaires", {
  # Créer un dataframe valide avec toutes les colonnes nécessaires
  df_valid <- data.frame(
    Code.de.la.commune = c("A", "B"),
    Libellé.de.la.commune = c("Commune1", "Commune2"),
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Pierre"),
    Code.sexe = c("M", "M"),
    Date.de.naissance = c("01/01/1980", "23/07/1975"),
    Libellé.de.la.fonction = c("Maire", "Adjoint"),
    Date.de.début.de.la.fonction = c("01/01/2020", "01/01/2021"),
    Code.nationalité = c("FR", "FR")
  )

  # Créer l'objet commune
  commune_obj <- creer_commune(df_valid)

  # Vérifier que l'objet est de type 'commune'
  expect_s3_class(commune_obj, "commune")

  # Vérifier que l'objet contient les informations correctes
  expect_equal(commune_obj$Code.de.la.commune, c("A", "B"))
  expect_equal(commune_obj$Libellé.de.la.commune, c("Commune1", "Commune2"))
  expect_equal(commune_obj$Nom.de.l.élu, c("Dupont", "Martin"))
})
