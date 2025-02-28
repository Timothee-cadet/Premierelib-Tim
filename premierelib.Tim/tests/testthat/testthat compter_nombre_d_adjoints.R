# Test 1 : Vérifier que la fonction échoue si la colonne Libellé.de.la.fonction est manquante

test_that("compter_nombre_d_adjoints échoue si la colonne 'Libellé.de.la.fonction' est manquante", {
  # Créer un dataframe sans la colonne Libellé.de.la.fonction
  df_invalid <- data.frame(Code.de.la.commune = c("A", "B", "C"))

  # Vérifier que la fonction lève une erreur si la colonne Libellé.de.la.fonction est manquante
  expect_error(compter_nombre_d_adjoints(df_invalid),
               "La colonne 'Libellé.de.la.fonction' est requise dans le DataFrame")
})


# Test 2 : Vérifier que la fonction compte correctement les adjoints dans un DataFrame valide

test_that("compter_nombre_d_adjoints compte correctement les adjoints", {
  # Créer un dataframe avec des fonctions incluant 'adjoint'
  df_valid <- data.frame(
    Libellé.de.la.fonction = c("Maire", "Adjoint au Maire", "Adjoint aux finances", "Conseiller municipal")
  )

  # Vérifier que la fonction compte correctement les adjoints
  count <- compter_nombre_d_adjoints(df_valid)

  # Vérifier que le nombre d'adjoints est correct (ici 2 adjoints)
  expect_equal(count, 2)
})
