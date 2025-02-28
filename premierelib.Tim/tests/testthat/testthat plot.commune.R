#Test 1 : Vérification de la génération du graphique pour une seule commune

test_that("plot.commune génère un graphique sans erreur pour un DataFrame valide", {
  # Créer un dataframe valide pour une seule commune
  df_commune <- tibble::tibble(
    Libellé.de.la.commune = c("Commune A", "Commune A", "Commune A", "Commune A"),
    Libellé.du.département = c("Département 1", "Département 1", "Département 1", "Département 1"),
    Code.de.la.catégorie.socio.professionnelle = c("A", "B", "A", "C"),
    Nom.de.l.élu = c("Dupont", "Durand", "Martin", "Leclerc")
  )

  # Vérifier que la fonction ne génère pas d'erreur
  expect_silent(plot.commune(df_commune))
})


#Test 2 : Vérification de l'erreur lorsqu'il y a plusieurs communes dans le dataframe

test_that("plot.commune soulève une erreur pour un DataFrame contenant plusieurs communes", {
  # Créer un dataframe avec plusieurs communes
  df_mult_communes <- tibble::tibble(
    Libellé.de.la.commune = c("Commune A", "Commune B", "Commune A", "Commune B"),
    Libellé.du.département = c("Département 1", "Département 1", "Département 1", "Département 1"),
    Code.de.la.catégorie.socio.professionnelle = c("A", "B", "A", "C"),
    Nom.de.l.élu = c("Dupont", "Durand", "Martin", "Leclerc")
  )

  # Vérifier que la fonction soulève une erreur
  expect_error(plot.commune(df_mult_communes),
               "Le data.frame contient plusieurs communes. Veuillez filtrer pour une seule commune.")
})
