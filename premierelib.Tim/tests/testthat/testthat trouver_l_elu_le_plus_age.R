#Test 1: Vérification de la fonctionnalité avec un DataFrame valide

test_that("trouver_l_elu_le_plus_age fonctionne avec un DataFrame valide", {
  # Créer un DataFrame avec des élus municipaux
  df_elu <- tibble::tibble(
    Nom.de.l.élu = c("Dupont", "Durand", "Martin", "Leclerc"),
    Prénom.de.l.élu = c("Jean", "Pierre", "Paul", "Marie"),
    Date.de.naissance = c("15/05/1973", "20/08/1963", "01/12/1978", "10/06/1953")
  )

  # Appeler la fonction pour trouver l'élu le plus âgé
  elu_plus_age <- trouver_l_elu_le_plus_age(df_elu)

  # Vérifier que la fonction retourne les informations correctes pour l'élu le plus âgé
  expect_equal(elu_plus_age$Nom.de.l.élu, "Leclerc")
  expect_equal(elu_plus_age$Prénom.de.l.élu, "Marie")
  expect_equal(elu_plus_age$Âge, 71)  # L'élu le plus âgé selon les dates données
})


#Test 2: Vérification du message d'erreur si la colonne "Date.de.naissance" est manquante

test_that("trouver_l_elu_le_plus_age lance une erreur si la colonne 'Date.de.naissance' est manquante", {
  # Créer un DataFrame sans la colonne 'Date.de.naissance'
  df_invalid <- tibble::tibble(
    Nom.de.l.élu = c("Dupont", "Durand", "Martin", "Leclerc"),
    Prénom.de.l.élu = c("Jean", "Pierre", "Paul", "Marie")
  )

  # Vérifier que la fonction lance une erreur
  expect_error(trouver_l_elu_le_plus_age(df_invalid),
               "Le data.frame doit contenir la colonne 'Date.de.naissance'.")
})
