#Test 1 : Vérifier que la fonction génère un graphique sans erreur avec un DataFrame valide

test_that("plot_code_professions génère un graphique sans erreur avec un DataFrame valide", {
  # Créer un dataframe valide avec la colonne 'Code.de.la.catégorie.socio.professionnelle'
  df_valid <- data.frame(
    Code.de.la.catégorie.socio.professionnelle = c("A", "B", "A", "C", "B", "A")
  )

  # Vérifier que la fonction ne génère pas d'erreur
  expect_silent(plot_code_professions(df_valid))
})

#Test 2 : Vérifier qu'une erreur est générée si la colonne requise est absente

test_that("plot_code_professions génère une erreur si la colonne requise est absente", {
  # Créer un dataframe sans la colonne 'Code.de.la.catégorie.socio.professionnelle'
  df_invalid <- data.frame(
    Code.other = c("A", "B", "A", "C", "B", "A")
  )

  # Vérifier que la fonction génère une erreur
  expect_error(plot_code_professions(df_invalid), "Le data.frame doit contenir la colonne 'Code.de.la.catégorie.socio.professionnelle'.")
})
