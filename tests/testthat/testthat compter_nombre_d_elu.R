#Test 1 : Vérifier que la fonction échoue si les colonnes nécessaires sont manquantes

test_that("compter_nombre_d_elu échoue si les colonnes nécessaires sont manquantes", {
  # Créer un dataframe sans les colonnes nécessaires
  df_invalid <- data.frame(Code.de.la.commune = c("A", "B", "C"))

  # Vérifier que la fonction lève une erreur si les colonnes nécessaires sont manquantes
  expect_error(compter_nombre_d_elu(df_invalid),
               "Les colonnes 'Nom.de.l.élu', 'Prénom.de.l.élu' et 'Date.de.naissance' sont requises dans le DataFrame")
})

#Test 2 : Vérifier que la fonction compte correctement le nombre d'élus dans un DataFrame valide

test_that("compter_nombre_d_elu compte correctement le nombre d'élus", {
  # Créer un dataframe avec des élus
  df_valid <- data.frame(
    Nom.de.l.élu = c("Dupont", "Martin", "Lemoine", "Dupont"),
    Prénom.de.l.élu = c("Pierre", "Jacques", "Marie", "Pierre"),
    Date.de.naissance = c("01/01/1970", "02/02/1980", "10/10/1990", "01/01/1970")
  )

  # Vérifier que la fonction compte correctement les élus (ici 3 élus uniques)
  count <- compter_nombre_d_elu(df_valid)

  # Vérifier que le nombre d'élus est correct
  expect_equal(count, 3)
})
