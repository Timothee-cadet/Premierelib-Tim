library(testthat)

# Test 1 : Vérifier que la fonction échoue si la colonne Date.de.naissance est manquante
test_that("calcul_distribution_age échoue si la colonne 'Date.de.naissance' est manquante", {
  # Créer un dataframe sans la colonne Date.de.naissance
  df_invalid <- data.frame(Code.de.la.commune = c("A", "B", "C"))

  # Vérifier que la fonction lève une erreur si la colonne Date.de.naissance est manquante
  expect_error(calcul_distribution_age(df_invalid),
               "La colonne 'Date.de.naissance' est requise dans le DataFrame")
})


#Test 2: Ce test vérifie qu'on ignore les NA et qu'on calcule correctement les quantiles
test_that("calcul_distribution_age ignore les valeurs manquantes et calcule les quantiles correctement", {
  # Créer un dataframe avec des valeurs manquantes dans la colonne Date.de.naissance
  df_with_na <- data.frame(
    Code.de.la.commune = c("A", "B", "C", "D"),
    Date.de.naissance = c("01/01/1980", NA, "23/07/2000", "15/05/1990")
  )

  # Calcul des quantiles
  quantiles <- calcul_distribution_age(df_with_na)

  # Vérifier que les quantiles sont calculés
  expect_type(quantiles, "double")
  expect_equal(length(quantiles), 5) # 5 quantiles (min, Q1, médiane, Q3, max)

  # Vérifier que la valeur manquante a été ignorée dans les calculs
  expect_true(all(!is.na(quantiles)))
})
