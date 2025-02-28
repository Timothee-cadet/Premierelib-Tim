# Test 1 : Vérification de la génération du graphique pour un seul département

test_that("plot.departement génère un graphique sans erreur pour un DataFrame valide", {
  # Créer un dataframe valide pour un seul département
  df_departement <- tibble::tibble(
    Libellé.du.département = c("Département 1", "Département 1", "Département 1", "Département 1"),
    Libellé.de.la.commune = c("Commune A", "Commune B", "Commune C", "Commune D"),
    Code.de.la.catégorie.socio.professionnelle = c("A", "B", "A", "C")
  )

  # Vérifier que la fonction ne génère pas d'erreur
  expect_silent(plot.departement(df_departement))
})


#Test 2 : Vérification de l'erreur lorsqu'il y a plusieurs départements dans le dataframe

test_that("plot.departement soulève une erreur pour un DataFrame contenant plusieurs départements", {
  # Créer un dataframe avec plusieurs départements
  df_mult_depts <- tibble::tibble(
    Libellé.du.département = c("Département 1", "Département 2", "Département 1", "Département 2"),
    Libellé.de.la.commune = c("Commune A", "Commune B", "Commune C", "Commune D"),
    Code.de.la.catégorie.socio.professionnelle = c("A", "B", "A", "C")
  )

  # Vérifier que la fonction soulève une erreur
  expect_error(plot.departement(df_mult_depts),
               "Le data.frame contient plusieurs départements. Veuillez filtrer pour un seul département.")
})
