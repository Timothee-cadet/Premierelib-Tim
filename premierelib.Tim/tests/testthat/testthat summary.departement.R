#Test 1: Vérification du résumé pour un département valide

test_that("summary.departement affiche correctement les informations pour un département valide", {
  # Créer un objet de type 'département' (exemple simplifié)
  df_departement <- tibble::tibble(
    Libellé.du.département = "Département 1",
    Libellé.de.la.commune = c("Commune A", "Commune B", "Commune C", "Commune A"),
    Nom.de.l.élu = c("Dupont", "Durand", "Martin", "Leclerc"),
    Prénom.de.l.élu = c("Jean", "Pierre", "Paul", "Marie"),
    Date.de.naissance = as.Date(c("1973-05-15", "1963-08-20", "1978-12-01", "1953-06-10"))
  )

  # Simuler que 'df_departement' est de type 'département'
  class(df_departement) <- c("département", class(df_departement))

  # Capturer l'affichage de la fonction
  expect_output(summary.departement(df_departement),
                "Nom du département : Département 1")
  expect_output(summary.departement(df_departement),
                "Nombre de communes : 3")
  expect_output(summary.departement(df_departement),
                "Nombre d'élu.e.s : 4")
  expect_output(summary.departement(df_departement),
                "Distribution des âges des élu.e.s :")
  expect_output(summary.departement(df_departement),
                "Élu.e le/la plus âgé.e : Leclerc , Âge : 71 , Commune : Commune A")
  expect_output(summary.departement(df_departement),
                "Élu.e le/la plus jeune : Martin , Âge : 46 , Commune : Commune C")
  expect_output(summary.departement(df_departement),
                "Commune avec la moyenne d’âge la plus faible : Commune C")
  expect_output(summary.departement(df_departement),
                "Commune avec la moyenne d’âge la plus élevée : Commune A")
})


#Test 2: Vérification de la gestion d'un objet de type incorrect

test_that("summary.departement lance une erreur pour un objet non de type 'département'", {
  # Créer un dataframe qui n'est pas de type 'département'
df_invalid <- tibble::tibble(
  Libellé.du.département = "Département 1",
  Libellé.de.la.commune = c("Commune A", "Commune B"),
  Nom.de.l.élu = c("Dupont", "Durand"),
  Prénom.de.l.élu = c("Jean", "Pierre"),
  Date.de.naissance = as.Date(c("1973-05-15", "1963-08-20"))
)

# Vérifier que la fonction lance une erreur
expect_error(summary.departement(df_invalid),
             "L'objet doit être de type 'département'.")
})
