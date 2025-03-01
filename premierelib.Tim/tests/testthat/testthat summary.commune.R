#Test 1 : Vérification de l'affichage correct des informations pour une commune valide

test_that("summary.commune affiche correctement les informations pour une commune valide", {
  # Créer un objet de type 'commune' (exemple simplifié)
  df_commune <- tibble::tibble(
    Libellé.de.la.commune = "Commune A",
    Libellé.du.département = "Département 1",
    Code.de.la.catégorie.socio.professionnelle = c("A", "B", "A", "C"),
    Nom.de.l.élu = c("Dupont", "Durand", "Martin", "Leclerc"),
    Prénom.de.l.élu = c("Jean", "Pierre", "Paul", "Marie"),
    Âge = c(50, 60, 45, 70),
    Date.de.naissance = as.Date(c("1973-05-15", "1963-08-20", "1978-12-01", "1953-06-10"))
  )

  # Simuler que 'df_commune' est de type 'commune'
  class(df_commune) <- c("commune", class(df_commune))

  # Capturer l'affichage de la fonction
  expect_output(summary.commune(df_commune),
                "Nom de la commune : Commune A")
  expect_output(summary.commune(df_commune),
                "Nombre d'élu.e.s : 4")
  expect_output(summary.commune(df_commune),
                "Distribution des âges des élu.e.s :")
  expect_output(summary.commune(df_commune),
                "L'élu.e le ou la plus âgé.e :")
  expect_output(summary.commune(df_commune),
                "Nom : Leclerc")
  expect_output(summary.commune(df_commune),
                "Âge : 71")
})



#Test 2 : Vérification de l'erreur lorsqu'un objet de type incorrect est passé

test_that("summary.commune soulève une erreur pour un objet de type incorrect", {
  # Créer un DataFrame qui n'est pas de type 'commune'
  df_incorrect <- tibble::tibble(
    Libellé.de.la.commune = "Commune A",
    Libellé.du.département = "Département 1",
    Code.de.la.catégorie.socio.professionnelle = c("A", "B", "A", "C"),
    Nom.de.l.élu = c("Dupont", "Durand", "Martin", "Leclerc"),
    Prénom.de.l.élu = c("Jean", "Pierre", "Paul", "Marie"),
    Âge = c(50, 60, 45, 70)
  )

  # Vérifier que l'erreur est bien levée pour un objet de type incorrect
  expect_error(summary.commune(df_incorrect),
               "L'objet doit être de type 'commune'.")
})
